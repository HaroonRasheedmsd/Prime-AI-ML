# To create class and Objects of Student
class Student:
    #here we write properties
    subject = "Python"
    college = "ABC"
    
    # now to write the init method
    def __init__(self, name, college):
        self.name = name
        self.college = college
# here to create objects of class
std1 = Student("haroon", "abc")
std2 = Student("khan", "efg")

# now to print memory address of these objects
#print(std1, std2)

# now to print properties of objects using dot(.) operator
# print(std1.subject, std1.college)
# print(std2.subject, std2.college)

# To print parameters passed in init method
#print(std1.name, std2.college)
#print(std2.name, std2.college)

#===============================================================================================

# here i made new class called laptop to show types of methods
# we have three types of methods 1.instance, 2.class, and 3.static
# class laptop:
#     storage_type = "ssd"
    
#     # this is constructor
#     def __init__(self, RAM, storage):
#         self.RAM = RAM
#         self.storage = storage
        
#     # this is class method as we use docorator "@classmethod" and compulsary parameter called "cls"
#     @classmethod
#     def get_storage_type(cls):
#         print(f"storage type = {cls.storage_type}")
        
#     # this is instance method and use compulasary parameter called "self"
#     def get_info(self):
#         print(f"Laptop has {self.RAM} RAM & {self.storage} {self.storage_type}")
        
#     # this is static method use no compulsary parameter also use decorator called "@staticmethod"
#     @staticmethod
#     def calc_discount(price, discount):
#         final_price = price - (discount * price / 100)
#         print(f"discount price = {final_price}")

# l1 = laptop("16gb", "512gb")

# l1.calc_discount(40_000, 10)


#==================================================================================================

# practice problem of Product Store
# class Product:
#     count = 0
#     def __init__(self, name, price):
#         self.name = name
#         self.price = price
#         Product.count += 1
        
#     def get_info(self):
#         print(f"Price of {self.name} is Rs.{self.price}")
    
#     @classmethod
#     def get_count(cls):
#         print(f"total products in store = {cls.count}")
        
#     @staticmethod
#     def calc_discount(price, discount):
#         print(f"Discounted price is: {price - (price *discount / 100)}")
        
    
# p1 = Product("Phone", 5_000)
# p2 = Product("calculator", 1000)
# p3 = Product("pen", 20)

# p1.get_info()
# Product.get_count()
# p1.calc_discount(p1.price, 10)

#===========================================================================================
# here we work on data hiding (ecapsulation) 
# class BankAccount:
    
#     def __init__(self, name, balance):
#         self.name = name
#         self.__balance = balance # here balance is made priveate by using double underscore 
        
#     #to access private from out of the class we use getter and setter
#     def get_balance(self):
#         return self.__balance
    
#     def set_balance(self, newBalance):
#         self.__balance = newBalance

# acc1 = BankAccount("Haroo", 4555)


# acc1.set_balance(23544)
# print(acc1.get_balance())

# # also to access private attribut we use class name with attribute like
# print(acc1.name, acc1._BankAccount__balance)


#==============================================================================================

# here we will study inheritance it is the process that subcalss or child class can access parent
# class attributes and methods like

class Employee:
    start_time = "10am"
    end_time = "6pm"
    
    def change_time(self, new_end_time):
        self.end_time = new_end_time

class Teacher(Employee): #Teacher class inherite Employee class
    def __init__(self, subject):
        self.subject = subject
        
t1 = Teacher ("Math")
t1.change_time("3pm")
print(t1.subject, t1.start_time, t1.end_time)