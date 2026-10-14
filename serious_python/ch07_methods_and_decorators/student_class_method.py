from pprint import pprint

class Student:
    school_name = 'Harvard'

    def __init__(self, name, age):
        self.name = name
        self.age = age

    @classmethod
    def change_school(cls, name):
        print(Student.school_name)
        Student.school_name = name

    @classmethod
    def change_school_again(cls, name):
        print(cls.school_name)
        cls.school_name = name

jessa = Student('Jessa', 20)
mike = Student('Mike', 21)
pprint(jessa.school_name)
pprint(mike.school_name)
Student.change_school('MIT')
pprint(jessa.school_name)
pprint(mike.school_name)
Student.change_school('Yale')
pprint(jessa.school_name)
pprint(mike.school_name)