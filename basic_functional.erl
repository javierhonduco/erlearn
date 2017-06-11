-module(basic_functional).


main(_) ->
  io:format("~p~n", [lists:map(fun(X) -> X*X end, [1, 2, 3, 4])]),
  io:format("~p~n", [lists:filtermap(fun(X) -> case X rem 2 of 0 -> {true, X}; _ -> false end end, [1, 2, 3, 4])]),
  io:format("~p~n", [lists:flatten([1, [2], [3, [4]]])]).
