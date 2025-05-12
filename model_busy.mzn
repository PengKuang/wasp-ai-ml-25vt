int: T_start = 8; % start time slot
int: T_end = 17; % end time slot
int: num_people; % number of people

array[1..num_people] of set of int: busy_times;

% find all time slots when everyone is free
set of int: time_slots = T_start..T_end;

set of int: all_busy = {t | p in 1..num_people, t in busy_times[p]};
set of int: everyone_free = time_slots diff all_busy; 

solve satisfy;

output ["Time slots when everyone is free: ",show(everyone_free)];
