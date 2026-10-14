import pytest

try:
    import mylib
except ImportError:
    mylib = None

@pytest.mark.skipif(mylib is None, reason="mylib is not available")
def test_mylib():
    assert mylib.foobar() == 42

def test_skip_at_runtime():
    if True:
        pytest.skip("Finally I don't want to run it.")

@pytest.mark.dicttest
def test_something():
    a = ['a', 'b']
    assert a == a

def test_something_else():
    assert False

# --------------------------------------
# pytest -v test_skip.py
# pytest -v test_skip.py -k test_mylib
# pytest -v test_skip.py -m dicttest
# pytest -v test_skip.py -m 'not dicttest'
# --------------------------------------