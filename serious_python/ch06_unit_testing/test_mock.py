from unittest import mock

m = mock.Mock()

def print_hello():
    print("hello mock!")
    return 43

m.some_method.return_value = 42
m.some_method.side_effect = print_hello
m.some_method()
m.some_method.call_count