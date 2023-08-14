def add_three_num():

    num_add = 3+5+6

    return(num_add)

#print(add_three_num())

#functions with string
def print_my_name():
    myName="Nathaniel Obafemi" #global variable
    print(myName)
#print_my_name()

def check_variable_type():
    message = 'meass'
    if type(message) == str:
        return True
    return False
#check_variable_type()

'''name = 'Nath'
def print_name():
    print(name)

def print_nothing():
    print('Nothing')

if name is not None:
    print_name()
else:
    print_nothing()'''

   
def multipy_two_nos():
    return (5*4)
#print(multipy_two_nos())


def print_my_name():
    my_name = 'Nathaniel Obafemi'
    return my_name
print(print_my_name())

def variable_check(variable):
    if type(variable) == str:
        return 'This is a string'
    elif type(variable) == int:
        return 'This is an integer'
    elif type(variable) == list:
        return 'This is a List'
    elif type(variable) == tuple:
        return 'This is a Tuple'
    elif type(variable_check) == dict:
        return "this is dictionary"
    else:
        return 'Unknown type'

result = variable_check('yhb')
print(result)
