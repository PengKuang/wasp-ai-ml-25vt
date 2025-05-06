int: T = 10; % total time slots
int: N = 10; % number of people

array[1..N] of string: people;
array[1..N] of set of int: busy;

% find all time slots when everyone is free
set of int: time_slots = 1..T;

set of int: all_busy = {t | p in 1..N, t in busy[p]};
set of int: everyone_free = time_slots diff all_busy; 

output ["Time slots when everyine is free: \(everyone_free)"];