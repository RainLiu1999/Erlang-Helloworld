-module(learn_erlang).
-export([hello/0, greet/2, head/1, second/1, same/2, old_enough/1, rich/2]).

hello() ->
	io:format("hello world ~s~n", ["Coder"]).

greet(male, Name) ->
	io:format("Hello Mr.~s~n", [Name]);
greet(female, Name) ->
	io:format("Hello Mrs.~s~n", [Name]);
greet(_, Name) ->
	io:format("Hello ~s~n", [Name]).

head([H|_]) ->
	H.

second([_,X|_]) ->
	X.

same(X, X) ->
	true;
same(_, _) ->
	false.

old_enough(Age) when Age >= 18 andalso Age < 150 ->
	true;
old_enough(_) ->
	false.

rich(Money, Age) when (Age >= 18 andalso Age <150) andalso (Money =:= 4000 orelse Money =:= 5000) ->
	true;
rich(_, _) ->
	false.