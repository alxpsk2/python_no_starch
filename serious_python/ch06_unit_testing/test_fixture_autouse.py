import pytest
import os

@pytest.fixture(autouse=True)
def change_user_env():
    print("this will run automatically before any tests because of autouse=True")
    curuser = os.environ.get("USER")
    os.environ["USER"] = "foobar"
    yield
    os.environ["USER"] = curuser

def test_user():
    assert os.getenv("USER") == "foobar"