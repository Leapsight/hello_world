%%%-------------------------------------------------------------------
%%% @author fcoronel
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2023 23:39
%%%-------------------------------------------------------------------
-module(hello_wamp).
-author("fcoronel").

%% API
-export([say_hi/2]).

say_hi(BinName, _KWArgs) when is_bitstring(BinName) ->
    say_hi(bitstring_to_list(BinName), _KWArgs);
say_hi(Name, _KWArgs) ->
    Message = hello_world:say_hi(Name),
    io:format("~p message: ~s~n", [?MODULE, Message]),
    list_to_bitstring(Message).
