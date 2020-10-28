import datetime
import json
import pika
import sys

# Will save all received data in the database
from utils import instanciate_db
from database import Dboperation
import processApp


class Recording:
    db_conn = None
    databaseop = None

    def __init__(self, conn=None):
        # Will instanciate the database 
        if conn is None:
            self.db_conn = instanciate_db()
        else:
            self.db_conn = conn
        self.databaseop = Dboperation(self.db_conn)

    def save_models(self, jsondata):
        # Will separate the the json data 
        origin = jsondata.get("origin")
        returnedid = self.databaseop.save_table_data(origin, "origin")
        jsondata.pop("origin")
        jsondata["origin"] = returnedid
        # changing keys of dictionary 
        jsondata['extern_id'] = jsondata['id'] 
        del jsondata['id'] 
        jsondata['created_on'] = datetime.datetime.now()
        box_id = self.databaseop.save_table_data(jsondata, "boxes")
        print(box_id)
        print("Processing in background")
        # Will process data in the background mode
        processApp.process_volume.delay(box_id)
