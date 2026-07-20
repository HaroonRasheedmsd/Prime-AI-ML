# # Q-1 Create Bank Account using classes and objects
# class BankAccount:
    
#     def __init__(self, account_number, owner_name, balance):
#         self.account_number = account_number
#         self.owner_name = owner_name
#         self.__balance = balance
    
#     #function to withdrawn money
#     def withdraw(self):
#         while True:
#             try:    
#                 self.account_number1 = int(input("Enter account number to withdraw: "))
#                 if self.account_number == self.account_number1:
#                     self.balance1 = int(input("Enter balance to withdraw: "))
#                     if self.__balance >= self.balance1:
#                         self.__balance = self.__balance - self.balance1
#                         print("Withdrawn successfully!")
#                         print(f"Your current Balance is: Rs.{self.__balance}")
#                         break
#                     else:
#                         print("Balance is low.")
#                 else:
#                     print("please enter valid account number.")
#             except ValueError:
#                 print("please enter only number. Thanks..")
        
#     # function to deposite money
#     def deposit(self):
#         while True:
#             try:    
#                 self.account_number1 = int(input("Enter account number to deposit: "))
#                 if self.account_number == self.account_number1:
#                     self.balance1 = int(input("Enter balance to deposite: "))
#                     self.__balance = self.__balance + self.balance1
#                     print("Deposite successfully!")
#                     print(f"Your current Balance is: Rs.{self.__balance}")
#                     break
#                 else:
#                     print("please enter valid account number.")
#             except ValueError:
#                 print("please enter only number. Thanks..")
                
#     # function to check balance             
#     def checkBalance(self):
#         while True:
#             try:
#                 self.account_num = int(input("Enter account number to check balance: "))            
#                 if self.account_number == self.account_num:
#                     print(f"Your balance is: Rs.{self.__balance}")
#                     break
#                 else:
#                     print("Enter valid account number.")
#             except ValueError:
#                 print("Only numbers are allowed. Thanks...")
    
# acc1 = BankAccount (12345, 'haroon', 50_000)
# acc2 = BankAccount (12346, 'rasheed', 4564)
# acc1.checkBalance()
# acc1.deposit() 
# acc1.withdraw()
#==============================================================================================================

# Q - 2 
# class Book:
#     def __init__(self, title, author, list_of_reviews):
#         #list_of_reviews = []
#         self.title = title
#         self.author = author
#         self.list_of_reviews = list_of_reviews 
#     def add_new_reviews(self):
#         while True:
#             try:
#                 self.title1 = input("Enter title of book for new review: ")
#                 #self.author1 = input("Enter author name for new review: ")
#                 if self.title == self.title1:
#                     rev = input(f"Enter review for {self.title} and {self.author}: ")
#                     self.list_of_reviews.append(rev)
#                     print(f"all reviews are {self.list_of_reviews} of {self.title} and {self.author}")
#                     break
#                 else:
#                     print("pleaes enter right title and author name. thanks")
#             except ValueError:
#                 print("invalid input")
                
#     def count_reviews(self):
#         return len(self.list_of_reviews)
    
# b1 = Book("chale", "haroon",[] )
# b1.add_new_reviews()
# print(b1.count_reviews())
# b1.add_new_reviews()
# print(b1.count_reviews())

#=====================================================================================

# # Q - 3
# class Student:
#     def __init__(self, name, roll_no, marks):

#         while name.strip() == "":
#             print("Name cannot be empty.")
#             name = input("Enter name again: ")

#         while not (1 <= roll_no <= 100):
#             print("Roll number must be between 1 and 100.")
#             roll_no = int(input("Enter roll number again: "))

#         while not (0 <= marks <= 100):
#             print("Marks must be between 0 and 100.")
#             marks = int(input("Enter marks again: "))

#         self.__name = name
#         self.__roll_no = roll_no
#         self.__marks = marks

#     # Getter Method
#     def getter(self):
#         return self.__name, self.__roll_no, self.__marks

#     # Setter Method
#     def setter(self):

#         # Name Validation
#         name = input("Enter new name: ")
#         if name.strip() == "":
#             print("Name cannot be empty.")
#         else:
#             self.__name = name

#         # Roll Number Validation
#         try:
#             roll_no = int(input("Enter roll number (1-100): "))
#             if 1 <= roll_no <= 100:
#                 self.__roll_no = roll_no
#             else:
#                 print("Roll number must be between 1 and 100.")
#         except ValueError:
#             print("Please enter a valid roll number.")

#         # Marks Validation
#         try:
#             marks = int(input("Enter marks (0-100): "))
#             if 0 <= marks <= 100:
#                 self.__marks = marks
#             else:
#                 print("Marks must be between 0 and 100.")
#         except ValueError:
#             print("Please enter valid marks.")


# s1 = Student("", 12, 85)

# s1.setter()

# print("\nUpdated Student Data:")
# print(s1.getter())

#====================================================================================================

# Q - 4
# class Shape: 
#     def area(self):
#         pass
    
# class Circle(Shape):
#     def __init__(self,pi,r):
#         self.pi = pi
#         self.r = r
        
#     def area(self):
#         a = self.pi *(self.r**2)
#         print(f"Area of Circle is {a}")
        
# class Rectangle(Shape):
#     def __init__(self, length, width):
#         self.length = length
#         self.width = width
        
#     def area(self):
#         a = self.length * self.width
#         print(f"Area of Rectangle is: {a}")
        
# class Triangle(Shape):
#     def __init__(self, base, height):
#         self.base = base
#         self.height = height
        
#     def area(self):
#         a = 1/2 * self.base * self.height
#         print(f"Area of Triangle is: {a}")
        
# c1 = Circle(3.14, 5)
# r1 = Rectangle(10, 4)
# t1 = Triangle(6, 8)
# c1.area()
# r1.area()
# t1.area()

# or 
# shapes = [
#     Circle(3.14,5),
#     Rectangle(10, 4),
#     Triangle(6, 8)
# ]
# for shape in shapes:
#     print(shape.area())

# ===============================================================================

# Q - 5 Concept of Inheritence
# class Vehicle:
#     def __init__(self, brand, model):
#         self.brand = brand
#         self.model = model
        
    
    
# class Car(Vehicle):
#     def __init__(self, brand, model, seats):
#         super().__init__(brand, model)
#         self.seats = seats
        
# class Bike(Vehicle): 
#     def __init__(self, brand, model, engin_cc):
#         super().__init__(brand, model)
#         self.engin_cc = engin_cc


# c1 = Car("Toyota", 2004, 4)
# b1 = Bike("toyouta",2004 ,1300)   
# print(c1.brand, c1.model, c1.seats)
# print(b1.model, b1.model, b1.engin_cc)     

#======================================================================================
# # Q-6  COncept of abstraction
# from abc import ABC, abstractmethod
# class Employee:
#     @abstractmethod
#     def calculate_salary(self):
#         pass
    
# class Intern(Employee):
#     def calculate_salary(self):
#         print("yes I am Intern but i will take manager seats.")
        
        
# class FullTimeEmployee(Employee):
#     def calculate_salary(self):
#         print("You have no power to take my seat.")

# class ContractEmployee(Employee):     
#     def calculate_salary(self):
#         print("No matter talent replace everything lets see who will win dears.")
     
# s = Intern()
# s1 = FullTimeEmployee()
# s2 = ContractEmployee()   
# s.calculate_salary()
# s1.calculate_salary()
# s2.calculate_salary()

#==================================================
# # Q - 7 
# class Person:
#     def __init__(self, name, age=None, address=None):
#         self.name = name
#         self.age = age
#         self.address = address

#     def display(self):
#         print(f"Name    : {self.name}")
#         print(f"Age     : {self.age}")
#         print(f"Address : {self.address}")
#         print()


# # name only
# p1 = Person("Ali")

# # name + age
# p2 = Person("Ahmed", 20)

# # name + age + address
# p3 = Person("Usman", 22, "Islamabad")

# p1.display()
# p2.display()
# p3.display()

#==========================================================
# Q-8 
# class Player:
#     # Class variable
#     player_count = 0

#     def __init__(self, name, level):
#         # Instance variables
#         self.name = name
#         self.level = level

#         # Increase player count whenever a new object is created
#         Player.player_count += 1

#     def display(self):
#         print(f"Player Name : {self.name}")
#         print(f"Level       : {self.level}")
#         print()


# p1 = Player("Haroon", 5)
# p2 = Player("Ali", 3)
# p3 = Player("Ahmed", 7)

# p1.display()
# p2.display()
# p3.display()

# print("Total Players:", Player.player_count)

#===============================================================
# Q -9 
# class Herbivore:
#     def __init__(self):
#         self.plant_food = "Berries"

#     def eat_plants(self):
#         print("Bear eats:", self.plant_food)


# class Carnivore:
#     def __init__(self):
#         self.meat_food = "Fish"

#     def eat_meat(self):
#         print("Bear eats:", self.meat_food)


# # Multiple Inheritance
# class Bear(Herbivore, Carnivore):
#     def __init__(self, name):
#         self.name = name

#         # Calling constructors of both parent classes
#         Herbivore.__init__(self)
#         Carnivore.__init__(self)

#     def display(self):
#         print("Bear Name:", self.name)


# b1 = Bear("Brown Bear")

# b1.display()
# b1.eat_plants()
# b1.eat_meat()

#====================================================================================================

# Q-10 OOP Chat System
# Message class
class Message:
    message_counter = 1

    def __init__(self, sender, content):
        self.sender = sender
        self.content = content          # Fixed: content was missing
        self.id = Message.message_counter
        Message.message_counter += 1

    def __str__(self):
        return f"({self.id}) {self.sender.username}: {self.content}"


# User class
class User:
    def __init__(self, username):
        self.username = username
        self.chatroom = None

    # join chatroom
    def join_chatroom(self, chatroom):
        if self.chatroom:
            print(f"{self.username} is already in room.")
        else:
            chatroom.add_user(self)
            self.chatroom = chatroom

            print(f"{self.username} joined {chatroom.name}")

    # leave chatroom
    def leave_chatroom(self):
        if not self.chatroom:
            print(f"{self.username} is not in any chatroom.")
        else:
            self.chatroom.remove_user(self)
            print(f"{self.username} left {self.chatroom.name}")
            self.chatroom = None

    # send message
    def send_message(self, content):
        if not self.chatroom:
            print(f"{self.username} cannot send a message (not in a chatroom).")
        else:
            self.chatroom.broadcast(self, content)


# chatroom class
class Chatroom:
    def __init__(self, name):
        self.name = name
        self.users = []
        self.messages = []

    def add_user(self, user):
        self.users.append(user)

    def remove_user(self, user):
        self.users.remove(user)

    def broadcast(self, sender, content):
        message = Message(sender, content)
        self.messages.append(message)      # Fixed: messages instead of message
        print(message)

    def show_chat_history(self):
        print(f"\nChat History of {self.name}")
        for msg in self.messages:          # Fixed: messages instead of message
            print(msg)


# main program
if __name__ == "__main__":

    room = Chatroom("Python Lounge")

    u1 = User("Alice")
    u2 = User("Bob")
    u3 = User("Charlie")

    u1.join_chatroom(room)
    u2.join_chatroom(room)

    u1.send_message("Hello everyone!")
    u2.send_message("Hi Alice!")

    u3.join_chatroom(room)

    u3.send_message("Hey guys, what's up?")

    room.show_chat_history()

    u1.leave_chatroom()
    u2.leave_chatroom()
    u3.leave_chatroom()