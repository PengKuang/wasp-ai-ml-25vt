int: num_people;
set of int: Time = 8..18;

array[1..num_people] of set of Time: busy;

var Time: meeting_time;

constraint
  forall(p in 1..num_people)(
    not (meeting_time in busy[p])
  );

solve satisfy;

output ["Available meeting time: ", show(meeting_time)];