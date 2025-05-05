int: num_people;
int: num_slots;        % Total number of time slots in the day
int: meeting_length;   % Required meeting length (in time slots)

% Each person's busy schedule: array of busy slots per person
array[1..num_people] of set of int: busy_times;

set of int: start_slots = 1..(num_slots - meeting_length + 1);

% Determine which start slots are valid (everyone is free for the full duration)
set of int: valid_start_slots = 
  { s | s in start_slots where 
      forall(p in 1..num_people)(
        forall(i in 0..meeting_length-1)(
          not (s + i in busy_times[p])
        )
      )
  };

output [
  "Valid meeting start slots: ", show(valid_start_slots)
];


num_people = 10;
num_slots = 10;             % 8 to 18 in 1 h intervals
meeting_length = 1;         % 1 hour meeting

busy_times = [
  {1, 2,    4, 5,    7, 8,     10},    
  {1,    3,    5,    7, 8,     10},    
  {   2, 3, 4,       7           },    
  {1,    3, 4, 5,       8,     10},    
  {1, 2, 3,          7,        10},    
  {1, 2,    4, 5,       8,     10},    
  {1, 2, 3,    5,    7,        10},    
  {1, 2, 3, 4, 5,    7, 8,     10},    
  {         4, 5,    7,        10},    
  {1, 2, 3, 4, 5,                },    
];