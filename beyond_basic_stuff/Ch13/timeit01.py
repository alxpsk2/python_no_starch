import timeit

# val = timeit.timeit('a, b = 42, 101; a = a ^ b; b = a ^ b; a = a ^ b')
# print(val)

# val = timeit.timeit('a, b = 42, 101; temp = a; a = b; b = temp')
# print(val)

val = timeit.timeit("random.randint(1, 100)", "import random", number=10000000)
print(val)
