# All functions defined here with the decorator @app.task will 
# allow us to process operation in the background
from processing import Processing
from recording import Recording
from celery import Celery
import os


app = Celery('processApp',
             backend='rpc://',
             broker='pyamqp://guest@rabbitmq//')


@app.task
def process_volume(box_id):
    # Will process operation from the box_id information
    print('In the process volume')
    processing = Processing()
    processing.calculate_volume(box_id)


@app.task
def record_data(data):
    # Can record data in background process
    print('In the record data')
    record = Recording()
    record.save_models(data)
