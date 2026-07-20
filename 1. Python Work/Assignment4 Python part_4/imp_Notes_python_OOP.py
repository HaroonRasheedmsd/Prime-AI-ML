# class Student:
#     __gpa = 64
#     def __init__(self, __gpa):
#         self.__gpa = __gpa
        
#     def get_gpa(self):
#         return self.__gpa
    
#     def set_gpa(self,__gpa):
#         self.__gpa = __gpa
        
    
# s1 = Student(34)
# print(s1.get_gpa())
# s1.set_gpa(22)
# print(s1.get_gpa())

# class PasswordManager:
#     def __init__(self, password):
#         self.__password = password
        
#     def chek_password(self,password):
#         return self.__password == password
    
#     def change_password(self, old_password, new_password):
#         if self.__password == old_password:
#             self.__password = new_password
#             print("Password changed successfully")
#         else:
#             print("Old password is incorrect")
    
# p1 = PasswordManager("abc123")
    
# print(p1.check_password("abc123"))
# print(p1.check_password("hello"))
# p1.change_password("abc123", "newpass")
# print(p1.check_password("newpass"))

class PasswordManager:
    def __init__(self, password):
        self.__password = password

    def check_password(self, password):
        return self.__password == password

    def change_password(self, old_password, new_password):
        if self.__password == old_password:
            self.__password = new_password
            print("Password changed successfully.")
        else:
            print("Old password is incorrect.")


p1 = PasswordManager("abc123")

print(p1.check_password("abc123"))
print(p1.check_password("hello"))

p1.change_password("abc123", "newpass")

print(p1.check_password("newpass"))

