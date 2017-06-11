-module(basic_stuff).
-export([max_number/1, reverse_list/1]).


max_number([Head|Tail]) ->
  max_number(Tail, Head).

max_number([], Result) ->
  Result;
max_number([Head|Tail], LocalMax) ->
  if Head > LocalMax ->
    max_number(Tail, Head);
   true ->
    max_number(Tail, LocalMax)
  end.


reverse_list(List) ->
  reverse_list(List, []).

reverse_list([], Sofar) ->
  Sofar;
reverse_list([Head|Tail], Sofar) ->
  reverse_list(Tail, [Head|Sofar]).
