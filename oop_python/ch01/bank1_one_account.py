account_name = "Joe"
account_balance = 100
account_password = "soup"

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
        if user_pw != account_password:
            print("Incorrect password")
        else:
            print(f"You balance is: {account_balance}")
    elif action == "d":
        print("Deposit:")
        user_deposit_amount = input("Please enter amount to deposit: ")
        user_deposit_amount = int(user_deposit_amount)
        user_pw = input("Please enter the password: ")
        if user_deposit_amount < 0:
            print("You cannot deposit a negative amount!")
        elif user_pw != account_password:
            print("Incorrect password")
        else:
            account_balance = account_balance + user_deposit_amount
            print(f"You new balance is: {account_balance}")
    elif action == "s":
        print("Show:")
        print(f"    Name: {account_name}")
        print(f"    Balance: {account_balance}")
        print(f"    Password: {account_password}")
        print()
    elif action == "q":
        break
    elif action == "w":
        print("Withdraw:")
        user_withdraw_amount = input("Please enter the amount to withdraw: ")
        user_withdraw_amount = int(user_withdraw_amount)
        user_pw = input("Please enter the password: ")
        if user_withdraw_amount < 0:
            print("You cannot deposit a negative amount!")
        elif user_pw != account_password:
            print("Incorrect password")
        elif user_withdraw_amount > account_balance:
            print("You cannot withdraw more than you have in your account")
        else:
            account_balance = account_balance - user_withdraw_amount
            print(f"You new balance is: {account_balance}")
            
print("Done")