-module(erlang_hello). %% module takes the name of the file
-export([add/2, factorial/1, area/3, area/1, speak/1, factorial/2, insert/0, say_something/2, start_concurrency/2, receive_message/0]). %% makes functions visible. add/2(takes two arguments)

% #################################
% COMPILE
% c("erlang_hello").
% RUN
% erlang_hello:add(3,4).
% #################################


% NOTE:may not be read by parser
%% NOTE: used for the system.eg making documentino %% @doc 
% adds two numbers
add(X, Y) -> %% head
	X + Y.   %% body	


factorial(N) when N > 0 -> 
	N * factorial(N - 1);

factorial(0) -> 
	1.

% case statement
area(Type, N, M) ->
	case Type of 
		square -> N * N;
		circle -> math:pi() * N * N;
		rectangle -> N * M
	end.

% case statement pattern matching
area({square, N}) ->
	N * N;

area({circle, N}) ->
	math:pi() * N * N;

area({triangle, B, H}) ->
	0.5 * B * H;

% incase of no input, show error
area(_) ->
	{error, invalidInput}.

speak(Animal) ->
	Talk = if
				(Animal == cat) -> meou;
				(Animal == horse) -> wuuhhuhu;
				true -> no_sound % (else) incase there is not match
			end,
	io:format("~w says ~w ~n", [Animal, Talk]).


% factorial using accumulator(Total)
factorial(N, Total) when N > 0 ->
	factorial(N - 1, N * Total);

factorial(0, Total) ->
	Total.

% has bugs
insert() ->
	value = io:get_line("prompt: "),
	io:format("~s ~n", [value]).

% print_value() ->
% 	io:format(value).

say_something(_, 0) ->
	io:format("Done ~n");
say_something(Value, Times) ->
	io:format("~s ~n", [Value]),
	say_something(Value, Times - 1).

% NOTE: functions header must have uppercase values (Value not value)
start_concurrency(Value1, Value2) ->
	spawn(erlang_hello, say_something, [Value1, 7]),
	spawn(erlang_hello, say_something, [Value2, 3]).


receive_message() ->
	receive
		{factorial, Int} ->
			% ~p allows printing abitrary data
			io:format("Factorial for ~p is ~p: ", [Int, factorial(Int, 1)]),
			receive_message();
		Other ->
			io:format("Wrong data ~p", [Other]),
			receive_message()
	end.


%% clears the screen 
% clear() ->
    % io:format("\033[2J");