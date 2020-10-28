# Will check the database availibility
import psycopg2


def instanciate_db():
    # Connect to your postgres DB
    print("In the db instanciation")
    conn = None
    try:
        conn = psycopg2.connect(
                host="db",
                database="buyco",
                user="postgres",
                password="postgres"
                )
        print("Connected to db")
    except Exception as e:
        print("Error no connection to the db")
        print(e.args)
    return conn
