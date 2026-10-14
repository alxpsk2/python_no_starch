import pytest

@pytest.fixture(scope="module")
def database():
    db = "conn" # <some database connection>
    yield db
    db.close()

def test_insert(database):
    database.insert(123)

# Because we used the yield keyword and made database a generator, the code after the yield statement runs when the test is done.
# This gives us teardown functionality where we can close down the database connection once the test has completed.

# In this example, closing the database after each test might impose unnecessary runtime costs, so we can pass the scope argument
# to the fixture decorator, so other tests can use the same connection before closing it.

