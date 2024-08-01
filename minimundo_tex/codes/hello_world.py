def factorial(n):
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

def hello_world_n_factorial_time(n):
    fact_n = factorial(n)
    j = 0
    for i in range(fact_n):
        if i & 1 == 0:
            j += 1
        else:
            j -= 1

    print(j)
    print("Hello, World!")

# Test the function
hello_world_n_factorial_time(2)  # Prints "Hello, World!" once with O(5!) complexity
