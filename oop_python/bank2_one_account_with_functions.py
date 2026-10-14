account_name = ""
account_balance = 0
account_password = ""

def new_account(name, balance, pw):
    global account_name, account_balance, account_password
    account_name = name
    account_balance = balance
    account_password = pw

def show():
    global account_name, account_balance, account_password
    print(f"    Name: {account_name}")
    print(f"    Balance: {account_balance}")
    print(f"    Password: {account_password}")
    print()

def get_balance(pw):
    global account_name, account_balance, account_password
    if pw != account_password:
        print("Incorrect password")
        return None
    return account_balance

def deposit(amount_to_deposit, pw):
    global account_name, account_balance, account_password
    if amount_to_deposit < 0:
        print("You cannot deposit a negative amount!")
        return None
    
    if pw != account_password:
        print("Incorrect password")
        return None
    
    account_balance += amount_to_deposit
    return account_balance

def withdraw(amount_to_withdraw, pw):
    global account_name, account_balance, account_password
    if amount_to_withdraw < 0:
        print("You cannot withdraw a negative amount!")
        return None
    
    if pw != account_password:
        print("Incorrect password")
        return None
    
    if amount_to_withdraw > account_balance:
        print("You cannot withdraw more than you have in your account")
        return None
    
    account_balance -= amount_to_withdraw
    return account_balance

new_account("Joe", 100, "soup")

while True:
    print()
    print("Press b to get the balance")
    print("Press d to make a deposit")
    print("Press w to make a withdrawl")
    print("Press s to show the account")
    print("Press q to quit")
    print()

    action = input("What do you want to do? ")
    action = action.lower()
    action = action[0]
    print()

    if action == "b":
        print("Get Balance:")
        user_pw = input("Please enter the password: ")
        the_balance = get_balance(user_pw)
        if the_balance is not None:
            print(f"You balance is: {the_balance}")
    elif action == "d":
        print("Deposit:")
        user_deposit_amount = input("Please enter amount to deposit: ")
        user_deposit_amount = int(user_deposit_amount)
        user_pw = input("Please enter the password: ")

        new_balance = deposit(user_deposit_amount, user_pw)
        if new_balance is not None:
            print(f"You new balance is: {new_balance}")