# https://pynative.com/python-class-method/

# Example 1: Create Class Method Using @classmethod Decorator
from datetime import date

class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    @classmethod
    def calculate_age(cls, name, birthyear):
        return cls(name, date.today().year - birthyear)
    
    def show(self):
        print(self.name + "'s age is: " + str(self.age))

jessa = Student('Jessa', 20)
jessa.show()

# create new object using the factory method
joy = Student.calculate_age("Joy", 1995)
joy.show()

# Example 2: Class Method in Inheritance
class Vehicle:
    brand_name = 'Audi'

    def __init__(self, name, price):
        self.name = name
        self.price = price

    @classmethod
    def from_price(cls, name, price):
        new_obj = cls(name, price)
        print('here 1')
        print(new_obj.name, new_obj.price)
        cls.brand_name = name
        return(new_obj)
    
    def show(self):
        print('here 2')
        print(self.name, self.price)
        print(f"class brand_name = {self.brand_name}")

class Car(Vehicle):
    def average(self, distance, fuel_used):
        mileage = distance / fuel_used
        print(self.name, 'Mileage', mileage)

audi = Car('Audi A4', 50000)
audi.show()

another_audi = Car.from_price('Audi A5', 57000)
another_audi.show()
audi.show()

print(type(audi))
print(type(another_audi))