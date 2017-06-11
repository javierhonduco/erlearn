#!/usr/bin/env escript

-module(hello_world).
-export([say_hi/1]).

say_hi(String) ->
  io:format("ohai ~s~n", [String]).

main(_) ->
  say_hi("Erlang VM").
