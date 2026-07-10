# # Q-1============================
# count = 0
# with open("names.txt", "w") as f:
#     for i in range(5):
#         count +=1
#         name = input(f"Enter {count} name: ")
#         f.write(f"{name}\n")
        
# with open("names.txt", "r") as f:
#     data = f.read()
#     print(data)

# # Q-2 =============================
# with open("log.txt", "a") as f:
#     f.write("Program runs successfully.\n")
    
# with open("log.txt", "r") as f:
#     data = f.read()
#     print(data)

# # Q-3 ===============================
# lst = [5, 10, 15, 20, 25]
# lst = [val for val in lst if val > 15]
# print(lst)

# # Q - 4 ==============================
# import json
# pyt_dic = {
#     "Peshawar" : 300000,
#     "Lahor" : 4000000,
#     "Queta" : 100000
# }

# with open("cities.json", "w") as f:
#     json.dump(pyt_dic,f , indent = 4, sort_keys = True)
    
# with open("cities.json", "r") as f:
#     pyth_dic = json.load(f)
#     print(pyth_dic)

# with open("cities.json", "w") as f:
#     new_city = input("Enter new city: ")
#     city_population = input(f"Enter {new_city} population: ")
#     pyt_dic.update({new_city:city_population})
#     json.dump(pyt_dic, f)  
#     # or also use below line only instead of above two lines
#     #json.dump({new_city:city_population} ,f) 

# Q-5 ===================================
try:
    with open("data.txt", "r") as f:
        f.read()
        
except FileNotFoundError:
    print("File not found")
    
    