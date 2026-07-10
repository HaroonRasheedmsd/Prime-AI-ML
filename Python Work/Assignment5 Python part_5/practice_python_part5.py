# # File I/O: in this we will discuss multiple operation like

# # 1. we will discuss read operation
# # here first step is to open file to perform operations
# f = open ("sample.txt", "r")

# # Now as we open then we will apply read function
# data = f.read()
# print(data)

# # as point is at the end so nothing we print in readline() because pointer already at the end
# # for this we use function seek(0) which brings pointer back to beggining
# f.seek(0)

# # if we want to read line by line we use readline()
# data = f.readline()
# print(data)

# # to print in a list all line we use readlines()
# f.seek(0)
# data = f.readlines()
# print(data)

# # As we open file it necessary to close file to prevent any accindental alters
# f.close()

# ==============================================================

# # 2. Write mode will be discussed

# # here w mode is use to overwrite
# # f = open("sample.txt", "w")

# # here a mode is used to append
# f = open("sample.txt", "a")
# f.write("\nThis is new text which appended. \n done through write function")

# # write() function will ovewrite or append depends on the mode 
# # like "w" will overwrite and "a" will append only  

# # the below is for overwrite
# #f.write("This is new text which overwrite. \n done through write function")

# f.close()

#============================================================================

# 3. Different Modes 

# as we have done:
# 1. "r" reading mdoe and it is bydefault also if no one passed "r" is there
# 2. "w" writing, but this trancates file first means overwrite file or also create new file
# 3. "a" writing, but this only append there where pointer is

# now lets do others
# 4. "x" this creates new file from scratch  
# f = open ("sample3.txt", "x")
# f.write("this is new file name sample3 created through 'x' mode.")
# f.close()

# 5. others are binary "rb" and Text "rt" these are done to read in which format

# 6. + operator is both read and write, use with w, r, and a but for "w+" it replace characters that are passed
# f = open("sample2.txt", "w+")
# f.write("this w+")
# print(f.read())
# f.close()

# # 7. a+ this will append at the last but if we print nothing will be
# # printed because pointer is at the end
# f = open("sample2.txt", "a+")
# f.write("this a+")
# print(f.read())
# f.close()

# 8. r+ this replace the starting character which are  other remains same

#====================================================================

# with Keyword

# as there's always room for error to open and close explicity files so for that
# we use with keyword which is simpler way to prevent from this and no need of close e.g.
# with open("sample3.txt", "r") as f:
#     data = f.read()
#     print(data)
#     print(len(data))

#===================================================================

# Delete files
# we use os module this is python builtin module to interact with system
# e.g. we only pass name of file or path 
# import os
# os.remove("sample3.txt")

#==========================================================================
 
# # Word Search
# data = True
# line = 1
# word = "through"

# with open("sample.txt", "r") as f:
#     while data:
#         data = f.readline()
#         if (word in data):
#             print(f"{word} is found in line {line}")
#             #break # it is used when first time found then break but for all don't use break
#         line += 1

#=====================================================================================

# # Exception handling this prevent code to cause error and it stop 
# try:
#     x = int(input("Enter x: "))
#     ans = 10/x
# except ZeroDivisionError:
#     print(f"invalid input.")
# except ValueError:
#     print(F"Invalid input. ")
# else: # run when no exception occur
#     print(f"ans = {ans}")
# finally: # finally keyword will run no matter exception occur or not
#     print("End of program")

#===================================================================================

# list Comprehensions
# structure is: [output for item in iterable if condition]

# e.g. lets print squares of 0 to 5 and that must be only odd two ways;

# # using loop 
# sq = []
# for i in range(6):
#     if i % 2 != 0:
#         sq.append(i*i)
# print(sq)

# # using list comprehension
# sq = [i * i for i in range(6) if i % 2 != 0]
# print(sq)

# =======================================================================

# Json Module
# four functions 
# 1.json.loads() form json to python and s in loads used for string
# 2.json.dumps() from python object to json and same s for string
# 3.json.load() form json to python but use for general file not only string
# 4.json.dump() form python to json but use for general file 

# import json
# #from json to python only for string=========

# json_str = '{"name": "haroon", "isTeacher": true}' # it is json string
# py_obj = json.loads(json_str) # to convert json string into python obj
# print(type(py_obj), py_obj)


# # from python to json only for string============

# pyt_obj = {
#     "name": "haroon",
#     "isTeacher" : True
# }
# json_str = json.dumps(pyt_obj)
# print(type(json_str), json_str)

# #from json to python using general file despite only string========= 
# #like we have json file 
# with open("data.json") as f:
#     pyt_obj = json.load(f)
#     print(pyt_obj) 
#     print(type(pyt_obj))
    
# #from python to json===============
# data = {
#     "name": "haron",
#     "isTeacher": True,
#     "age":22
# }

# with open("data.json", "w") as f:
#     json.dump(data, f , indent = 4 , sort_keys = True)
    
