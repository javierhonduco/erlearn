-module(ping_pong).
-export([start/0]).


ping() ->
  receive
    {_, 0} ->
      io:format("stopping ping...~n");
    {Pong_pid, Upto} ->
      io:format("ping!~n"),
      Pong_pid ! {self(), Upto-1},
      ping()
  end.

pong() ->
  receive
    {_, 0}->
      io:format("ping-pong finished!~n");
    {Ping_pid, Upto}->
      io:format("pong!~n"),
      Ping_pid ! {self(), Upto-1},
      pong()
  end.

start() ->
  io:format("starting ping-pong!! :D~n"),
  Upto = 10,
  Ping_pid = spawn(fun() -> ping() end),
  Pong_pid = spawn(fun() -> pong() end),
  Pong_pid ! {Ping_pid, Upto}.
