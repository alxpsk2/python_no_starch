import unittest
from name_function import get_formatted_name

class NamesTestCase(unittest.TestCase):
    """"""
    def test_first_last_name(self):
        formatted_name = get_formatted_name('janis', 'joplin')
        self.assertEqual(formatted_name, 'Janis Joplin')

    def test_first_middle_last_name(self):
        formatted_name = get_formatted_name('stevie', 'vaughn', 'ray')
        self.assertEqual(formatted_name, 'Stevie Ray Vaughn')

if __name__ == '__main__':
    unittest.main()
