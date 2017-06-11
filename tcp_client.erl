% from the Programming Erlang book (Chapter 14.1, Using TCP, p. 240)
-module(tcp_client).


nano_get_url() ->
  nano_get_url("www.google.com").

nano_get_url(Host) ->
  {ok, Socket} = gen_tcp:connect(Host, 80, [binary, {packet, 0}]),
  ok = gen_tcp:send(Socket, "GET / HTTP/1.0\r\n\r\n"),
  receive_data(Socket, []).

receive_data(Socket, Sofar) ->
  receive
    {tcp, Socket, Bin} ->
      receive_data(Socket, [Bin|Sofar]);
    {tcp_closed, Socket} ->
      % I was wondering why was the data being preppended and then
      % reversed and it's explained some paragraphs later! It's for
      % performance reasons! Preppending seems to be a constant time
      % operation, while appending seems to be linear. I wonder what
      % motivated such design!
      list_to_binary(lists:reverse(Sofar))
  end.

main(_) ->
  Result = nano_get_url(),
  io:format(Result).
