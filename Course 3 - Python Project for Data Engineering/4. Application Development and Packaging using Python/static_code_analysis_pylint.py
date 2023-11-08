"""Module provides a function to add two numbers"""
def add(number1, number2):
    """
    Returns the sum of two numbers
    
    Args:
        number1 (int): The first number
        number2 (int): The second number
        
    Returns:
        int: The sum of number1 and number2
    """
    return number1 + number2

NUM1 = 4
NUM2 = 5
TOTAL = add(NUM1, NUM2)
print(f"The sum of {NUM1} and {NUM2} is {TOTAL}")
