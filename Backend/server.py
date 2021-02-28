#############################################
### (c) ChargeQ 2020, ALL RIGHTS RESERVED ###
#############################################

# Import Flask web framework
from flask import Flask, jsonify
from flask_cors import CORS

# Import our data generator
from generator import return_list_of_random_cars, return_dict_of_random_cars

app = Flask(__name__)
CORS(app) # This enables cross-site requests, i.e. calling our API from anwhere

@app.route('/')
def greet_user():
    return "This is the ChargeQ API."

@app.route('/generate', )
def return_list_of_random_cars_x(number_of_cars=10):
    list_of_cars = return_list_of_random_cars(number_of_cars)
    return jsonify(list_of_cars)


@app.route('/optimize', methods=['POST'])
def pass_request_to_optimizer():
    return 
