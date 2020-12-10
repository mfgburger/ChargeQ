##!/usr/bin/env python3

#############################################
### (c) ChargeQ 2020, ALL RIGHTS RESERVED ###
#############################################

from flask import Flask

app = Flask(__name__)

@app.route('/')
def greet_user():
    return "This is the ChargeQ API."

@app.route('/dummy')
def return_dummy():
    vehicle_status = {
        "id": 0,
        "capacity": 58,
        "total_range": 420,
        "level": 50,
        "minutes_until_departure": 60, # todo change to hours_until_departure
        "target_range": 300,
    }
    return vehicle_status
    
@app.route('/optimize', methods=['GET', 'POST'])
def optimize():
    if request.method == "GET":
        # return the current queue
    else:
        # Pass POST data to optimizer and return new queue