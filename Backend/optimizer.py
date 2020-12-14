import uuid
import numpy as np


def return_dict_of_random_cars(number_of_cars):
    return random_car_list(length=5)

def random_car_list(length=5):
    ranges = np.random.poisson(lam=10, size=length)  # in km
    charges = np.random.uniform(low=0.0, high=1.0, size=length)  # charge from 0-1
    times = np.random.poisson(lam=10, size=length)  # in h
    priorities = np.random.randint(2, size=length) + 1  # 1: eco, 2: fast
    consumptions = [
                       0.2] * length  # kWh/km #todo https://www.virta.global/blog/ev-charging-101-how-much-electricity-does-an-electric-car-use
    speeds = 10 ** (np.random.randint(2,
                                      size=length) + 1)  # 10kW or 100kW https://www.transportenvironment.org/sites/te/files/publications/01%202020%20Draft%20TE%20Infrastructure%20Report%20Final.pdf
    list_of_cars = [Car(id=uuid.uuid4().hex,
                        state_of_charge=charges[i],
                        target_range=ranges[i],
                        hours_to_departure=times[i],
                        kwh_per_km=consumptions[i],
                        is_priority=priorities[i],
                        max_charging_speed=speeds[i],
                        station_id=uuid.uuid4().hex
                        ) for i in range(length - 1)]
    return list_of_cars


def optimize(list_of_cars, algorithm_name="classical"):
    list_of_cars = calculate_costs(list_of_cars)
    if algorithm_name == "classical":
        # "parametric" prioritization
        return classical(list_of_cars)
    else:
        return quantum(list_of_cars)

def calculate_costs(list_of_cars):
    for car in list_of_cars:
        car._cost = (1-car._state_of_charge) # plus whatever
    return list_of_cars

def classical(list_of_cars):
    # todo: formulate as a graph https: // stackoverflow.com / questions / 50179002 / graph - permutation - and -rotation - witn - networkx
    # calculate times
    # return loss
    sorted(list_of_cars, key=lambda car: car._cost)  # todo: naive
    # todo look at https://en.wikipedia.org/wiki/Scheduling_(computing)
    # todo look at  https://developers.google.com/optimization/scheduling/job_shop
    # how can I implement different algorithms side by side in the best way?
    # todo: for a start: earlierst deadline first (EDF)
    # look ar example projects
    loader = Loader()
    loading_actions = [loader.loading_action(car) for car in list_of_cars]
    return loading_actions



def quantum(list_of_cars):
    sorted(list_of_cars, key=lambda car: car._state_of_charge)  # todo: naive
    pass


class Loader:

    def __init__(self, car=0, power=0, start=0, end=0):
        self._car = car
        self._power = power
        self._start_time = start
        self._end_time = end

    def loading_action(self, car):
        self._start_time = self._end_time
        self._end_time = car.estimate_delta_capacity()/car._max_charging_speed+self._start_time
        return Loader(car, car._max_charging_speed, self._start_time, self._end_time)  # todo naive

    def print_values(self):
        print(self.__dict__)


class Car:

    def __init__(self, id, state_of_charge, target_range, hours_to_departure, kwh_per_km, is_priority,
                 max_charging_speed, station_id):
        self._id = id
        self._state_of_charge = state_of_charge
        self._target_range = target_range
        self._hours_to_departure = hours_to_departure
        self._kwh_per_km = kwh_per_km
        self._is_priority = is_priority
        self._max_charging_speed = max_charging_speed
        self._station_id = station_id
        self._cost = 0

    def return_values(self):
        return self.__dict__

    def print_values(self):
        print(self.__dict__)

    def estimate_delta_capacity(self):
        delta_capacity = self._target_range * self._kwh_per_km  # todo: naive
        return delta_capacity

    def calculate_cost(self):
        return self.estimate_delta_capacity  # todo: unused


if __name__ == "__main__":
    car_list = random_car_list(5)  # generate a number of cars for fun
    [car.print_values() for car in car_list]  # Look at the generated values for fun
    loading_actions = optimize(car_list)  # give him the list for optimization
    [loading_action.print_values() for loading_action in loading_actions]
