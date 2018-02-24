# https://projecteuler.net/problem=25

digit_bound, fib1, fib2, i = 10 ** 999, 1, 1, 2
fib1, fib2, i = fib2, fib1+fib2, i+1 while fib2 < digit_bound
i # => 4782
