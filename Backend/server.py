#############################################
### (c) ChargeQ 2020, ALL RIGHTS RESERVED ###
#############################################

# Import Flask web framework
from flask import Flask
from flask_cors import CORS

# Import our optimizer
from generator import return_dict_of_random_cars

app = Flask(__name__)
CORS(app) # This enables cross-site requests, i.e. calling our API from anwhere

@app.route('/')
def greet_user():
    return "This is the ChargeQ API."

@app.route('/cars', )
def return_list_of_random_cars(number_of_cars=10):
    list_of_cars = return_dict_of_random_cars(number_of_cars)
    return list_of_cars


@app.route('/optimize', methods=['GET', 'POST'])
def optimize(car_list, algorithm_name):
    if request.method == "GET":
        # return the current queue
        pass
    else:
        # Pass POST data to optimizer and return new queue
        pass
