import os
from dotenv import load_dotenv

exists = load_dotenv()
api_key = os.getenv("testvariable")
print(exists)
print(api_key)