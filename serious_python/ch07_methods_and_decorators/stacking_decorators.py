import functools
import inspect
from pprint import pprint

def check_is_admin(f):
    @functools.wraps(f)
    def wrapper(*args, **kwargs):
        func_args = inspect.getcallargs(f, *args, **kwargs)
        pprint(func_args)
        if func_args.get('username') != 'admin':
            raise Exception("This user is not allowed to get food.")
        return f(*args, **kwargs)
    return wrapper

@check_is_admin
def get_food(username, type='chocolate'):
    return type + " nom nom nom!"

@check_is_admin
def get_food_more_params(username, city, state, type='chocolate'):
    return type + " new nom nom nom!"

def check_user_is_not(username):
    def user_check_decorator(f):
        def wrapper(*args, **kwargs):
            if kwargs.get('username') == username:
                raise Exception("This user is not allowed to get food.")
            return f(*args, **kwargs)
        return wrapper
    return user_check_decorator

class Store(object):
    @check_user_is_not("admin")
    @check_user_is_not("user123")
    def get_food(self, username, food):
        return self.storage.get(food)

pprint(get_food('admin'))
pprint(get_food_more_params('admin', 'delray', 'FL', 'coffee'))