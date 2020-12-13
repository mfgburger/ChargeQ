##!/usr/bin/env python3

#############################################
### (c) ChargeQ 2020, ALL RIGHTS RESERVED ###
#############################################

from flask import Flask
from ChargeQ.optimizer import *

app = Flask(__name__)

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
    else:
        # Pass POST data to optimizer and return new queue