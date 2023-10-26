%%%-------------------------------------------------------------------
%% @doc hello_world public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_world_app).

-behaviour(application).

-export([start/2, stop/1, main/1]).

main(Args) ->
    io:format("~s~n", [hello_world:say_hi(Args)]).

start(_StartType, StartArg) ->
    io:format("~s~n", [hello_world:say_hi(StartArg)]),
    hello_world_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
