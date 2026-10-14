# BEFORE
class Store(object):
    def get_food(self, username, food):
        if username != 'admin':
            raise Exception("This user is not allowed to get food.")
        return self.storage.get(food)
    
    def put_food(self, username, food):
        if username != 'admin':
            raise Exception("This user is not allowed to put food.")
        self.storage.put(food)

#--------------------------------------------------------------------------------------

#AFTER
def check_is_admin(f):
    def wrapper(*args, **kwargs):
        if kwargs.get('username') != 'admin':
            raise Exception("This user is not allowed to get or put food.")
        return f(*args, **kwargs)
    return wrapper
    
class BetterStorage(object):
    @check_is_admin
    def get_food(self, username=None, food=None):
        return self.storage.get(food)
    
    @check_is_admin
    def put_food(self, username=None, food=None):
        return self.storage.put(food)