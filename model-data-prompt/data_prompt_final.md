Here is the schedule converted into an array format that the specified MiniZinc solver model can consume as data, with the names stored in a variable named people and the busy time slots stored in a variable named busy. Variables are already declared in the model file so you do not have to declare them in the data file.  

The schedule:
'''
Alice is busy 1 to 2, 4 to 5, 7 to 8, and 10.
Bob is busy 1, 3, 5, 7 to 8, and 10.
Chloe is busy 2 to 4 and 7.
Diana is busy 1, 3 to 5, 8 and 10.
Emma is busy 1 to 3, 7, and 10.
Fiona is busy 1 to 2, 4 to 5, 8, and 10.
Grace is busy 1 to 3, 5, 7, and 10.
Harley is busy 1 to 5, 7 to 8, and 10.
Ivy is busy 4 to 5, 7, and 10.
Jade is busy 1 to 5.
'''

The minizinc model:
'''
int: T = 10; % total time slots
int: N = 10; % number of people

array[1..N] of string: people;
array[1..N] of set of int: busy;

% find all time slots when everyone is free
set of int: time_slots = 1..T;

set of int: all_busy = {t | p in 1..N, t in busy[p]};
set of int: everyone_free = time_slots diff all_busy; 

output ["Time slots when everyine is free: \(everyone_free)"];
'''