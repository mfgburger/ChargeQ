import uuid
import numpy as np


def random_car_list(length=5):
    ranges = np.random.poisson(lam=10, size=length)  # in km
    charges = np.random.uniform(low=0.0, high=1.0, size=length) # charge from 0-1
    times = np.random.poisson(lam=10, size=length)  # in h
    priorities = np.random.randint(2, size=length) + 1  # 1: eco, 2: fast
    consumptions = [0.2]*length #kW/km #todo https://www.virta.global/blog/ev-charging-101-how-much-electricity-does-an-electric-car-use
    speeds = 10 ** (np.random.randint(2,
                                      size=length) + 1)  # 10kW or 100kW https://www.transportenvironment.org/sites/te/files/publications/01%202020%20Draft%20TE%20Infrastructure%20Report%20Final.pdf
    list_of_cars = [Car(id=uuid.uuid4().hex,
                        state_of_charge = charges[i],
                        target_range=ranges[i],
                        hours_to_departure=times[i],
                        consumption_per_km=consumptions[i],
                        is_priority=priorities[i],
                        max_charging_speed=speeds[i],
                        station_id=uuid.uuid4().hex
                        ) for i in range(length - 1)]
    return list_of_cars


def optimize(list_of_cars):
    # "parametric" prioritization
    list_of_cars = sorted(list_of_cars, key=lambda student: student.state_of_charge) # todo: naive
    # calculate times
    # return loss
    loading_actions = [LoadingAction(car) for car in list_of_cars]
    # todo look at https://en.wikipedia.org/wiki/Scheduling_(computing)
    # how can I implement differnet algorithms side by side in the best way?
    # look ar example projects
    return loading_actions


class LoadingAction:

    def __init__(self, car):
        self._car = car
        self._power = power
        self._start_time = start_time
        self._end_time = end_time

class Car:

    def __init__(self, id, state_of_charge, target_range, hours_to_departure, consumption_per_km, is_priority, max_charging_speed, station_id):
        self._id = id
        self._state_of_charge = state_of_charge
        self._target_range = target_range
        self._hours_to_departure = hours_to_departure
        self._consumption_kw_per_km = consumption_per_km
        self._is_priority = is_priority
        self._max_charging_speed = max_charging_speed
        self._station_id = station_id

    def print_values(self):
        print(self.__dict__)

    def estimate_delta_capacity(self):
        delta_capacity = self._target_range * self._consumption_kw_per_km # todo: naive
        return delta_capacity

    def calculate_cost(self):
        return self.estimate_delta_capacity # todo: naive


if __name__ == "__main__":
    car_list = random_car_list(5) # generate a number of cars for fun
    [car.print_values() for car in car_list] # Look at the generated values for fun
    optimize(car_list) # give him the list for optimization
