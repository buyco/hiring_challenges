# The aim of this file is to concentrate the database operation
# With this way we will not duplicate all code in the project
import psycopg2


class Dboperation:
    db_conn = None

    def __init__(self, conn):
        # Initialisation of the object -> will set the object attribute to make database operations
        self.db_conn = conn

    def set_database_data(self, data):
        # We will extract the columns names and the values from json dictionnary
        columns = [y for y in data.keys()]
        columns_name = ','.join(columns)
        allvalues = [y for y in data.values()]
        values = ', '.join('\'{0}\''.format(w) for w in allvalues)
        return columns_name, values
    
    def insert_data_in_db(self, table_name, columns, values):
        # Will insert the data in the selected tabale name
        cursor = self.db_conn.cursor()
        sql = f"INSERT INTO {table_name}({columns}) VALUES({values}) RETURNING id;"
        print(sql)
        cursor.execute(sql)
        self.db_conn.commit()
        return cursor.fetchone()[0]

    def get_volume_information_from_boxe(self, box_id):
        # Will fetch box data in order to calculate the volume 
        cursor = self.db_conn.cursor()
        sql = f"SELECT height, width, depth from boxes where id={box_id}"
        print(sql)
        cursor.execute(sql)
        self.db_conn.commit()
        return cursor.fetchone()
    
    def save_table_data(self, data, table_name):
        # will concentrate operations in order to get data and insert them in the selected 
        # table
        columns_name, values = self.set_database_data(data)
        return self.insert_data_in_db(table_name, columns_name, values)
    