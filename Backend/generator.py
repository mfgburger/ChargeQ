from optimizer import random_car_list

def return_dict_of_random_cars(number_of_cars):

    # Generate list of random Car objects using random_car_list() from CarList:
    list_of_cars = random_car_list(number_of_cars)
    
    # Compile a dict of dicts containing each cars properties:
    dict_of_random_cars = {}
    for car in list_of_cars:
        properties = car.return_values()
        id = properties['_id']
        properties.pop('_id')        
        dict_of_random_cars[id] = properties
        
    return dict_of_random_cars
    
 # Only for testing/debugging:
if __name__ == "__main__":
    cars = return_dict_of_random_cars(2)
    print(cars)
