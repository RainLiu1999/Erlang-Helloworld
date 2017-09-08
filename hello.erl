% hello world program
-module(hello).
-export([start/0]).

% #################################
% COMPILE
% c("hello").
% RUN
% hello:start().
% 
% COMPILE AND RUN WITHOUT SHELL
% $ erlc hello.erl
% $ erl -noshell -s hello start -s init stop
% #################################

start() ->
    io:fwrite("Hello, world!\n").


% Numbers = {numbers, 1,2,3,4}. 
% left must match to right(number of elements)
% {numbers, A,B,C,D} = Numbers. extract values and bind them to A, B, C, D
% A.
% 1
% _ anonymous variable
% ThingsToBuy = [{apples,10},{pears,6},{milk,3}].
% ThingsToBuy1 = [{oranges,4},{newspaper,1}|ThingsToBuy]. extends list(|)
% f(). forget any binding
% AVOID naming modules with system names. In case its done, delete the beam file