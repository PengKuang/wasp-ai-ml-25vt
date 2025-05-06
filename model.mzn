int: num_people;
int: num_slots;        % Number of time slots
int: meeting_length;   % Required meeting length (in time slots)

% Each person's busy schedule: array of busy slots per person
array[1..num_people] of set of int: busy_times;

set of int: start_slots = 1..(num_slots - meeting_length + 1);

% Determine which start slots are valid 
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
