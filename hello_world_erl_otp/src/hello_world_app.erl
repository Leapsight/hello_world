%%%-------------------------------------------------------------------
%% @doc hello_world public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_world_app).

-behaviour(application).

-export([start/2, stop/1, main/1]).

-include_lib("kernel/include/logger.hrl").

main(Args) ->
    io:format("~s~n", [hello_world:say_hi(Args)]).

start(_StartType, _StartArg) ->
    hello_world_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
