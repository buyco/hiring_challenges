# Will calculate the volume operation
import datetime
from utils import instanciate_db
from database import Dboperation


class Processing:
    db_conn = None
    databaseop = None 

    def __init__(self, conn=None):
        # Will instanciate the database connection
        if conn is not None:
            self.db_conn = conn
        else:
            self.db_conn = instanciate_db()
        print("conn")
        print(self.db_conn)
        self.databaseop = Dboperation(self.db_conn)

    def calculate_volume(self, box_id):
        # Will get the volume information from the boxes and will save it in the volumes db
        boxe_data = self.databaseop.get_volume_information_from_boxe(box_id)
        print(boxe_data)
        volume = boxe_data[0] *  boxe_data[1] * boxe_data[2]
        volume_data = {
            "height": boxe_data[0],
            "width": boxe_data[1],
            "depth": boxe_data[2],
            "volume": volume,
            "box_id": box_id
        }
        self.databaseop.save_table_data(volume_data, "volumes")
