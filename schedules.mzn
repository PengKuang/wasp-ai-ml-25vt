include "globals.mzn";

int: start_time = 8;
int: end_time = 18;
int: duration = 1;

set of int: Time = start_time..end_time-1;

array[1..10] of set of int: busy_times = [
    {8, 9, 11, 12, 14, 15, 17},  
    {8, 10, 12, 14, 17},         
    {9, 10, 11, 12, 14},         
    {8, 10, 11, 12, 15, 17},     
    {8, 9, 10, 14, 17},          
    {8, 9, 11, 12, 15, 17},      
    {8, 9, 10, 12, 14, 17},      
    {8, 9, 10, 11, 12, 14, 17},  
    {11, 12, 14, 17},            
    {8, 9, 10, 11, 12}           
];

var Time: meeting_time;

constraint forall(i in 1..10)(
    forall(t in busy_times[i])(
        meeting_time != t
    )
);

solve satisfy;

output ["Meeting time: " ++ show(meeting_time)];
