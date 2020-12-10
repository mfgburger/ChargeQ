import uuid
import numpy as np


def random_car_list(length=5):
    ranges = np.random.poisson(lam=10, size=length)  # in km
    times = np.random.poisson(lam=10, size=length)  # in h
    priorities = np.random.randint(2, size=length) + 1  # 1: eco, 2: fast
    consumptions = [0.2]*length #kW/km #todo https://www.virta.global/blog/ev-charging-101-how-much-electricity-does-an-electric-car-use
    speeds = 10 ** (np.random.randint(2,
                                      size=length) + 1)  # 10kW or 100kW https://www.transportenvironment.org/sites/te/files/publications/01%202020%20Draft%20TE%20Infrastructure%20Report%20Final.pdf
    list_of_cars = [Car(id=uuid.uuid4().hex,
                        target_range=ranges[i],
                        hours_to_departure=times[i],
                        consumption_per_km=consumptions[i],
                        is_priority=priorities[i],
                        max_charging_speed=speeds[i],
                        station_id=uuid.uuid4().hex
                        ) for i in range(length - 1)]
    return list_of_cars


class Optimizer:

    def __init__(self):
        some = 0

    def calculate(self):
        pass

    def calculate_quantum(self):
        pass


def estimate_need(target_range, hours_to_departure, consumption_per_km):
    hours_to_departure = hours_to_departure
    delta_capacity = target_range * consumption_per_km
    return delta_capacity, hours_to_departure


class Car:

    def __init__(self, id, target_range, hours_to_departure, consumption_per_km, is_priority, max_charging_speed, station_id):
        self._id = id
        self._est_delta_capacity, self._est_hours_to_departure = estimate_need(target_range, hours_to_departure, consumption_per_km)
        self._is_priority = is_priority
        self._max_charging_speed = max_charging_speed
        self._station_id = station_id

    def print_values(self):
        print(self.__dict__)


if __name__ == "__main__":
    car_list = random_car_list(5)
    [car.print_values() for car in car_list]
