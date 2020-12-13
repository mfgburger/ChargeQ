##!/usr/bin/env python3

#############################################
### (c) ChargeQ 2020, ALL RIGHTS RESERVED ###
#############################################

from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def greet_user():
    return "This is the ChargeQ API."


@app.route('/return_car', )
def return_car(number_of_cars):
    return list_of_cars


@app.route('/optimize', methods=['GET', 'POST'])
def optimize(car_list, algorithm_name):
    if request.method == "GET":
        # return the current queue
        pass
    else:
        # Pass POST data to optimizer and return new queue
        pass
