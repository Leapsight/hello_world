%%%-------------------------------------------------------------------
%%% @author fcoronel
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Oct 2023 11:47
%%%-------------------------------------------------------------------
-module(hello_server_SUITE).
-include_lib("common_test/include/ct.hrl").
-include_lib("stdlib/include/assert.hrl").
-compile([export_all]).

all() ->
    [hello_server_tests].

hello_server_tests(_Config) ->
    {ok, Pid} = hello_server:start_link(),
    io:format("Testing hello_server (Pid): ~p~n", [Pid]),
    [
        ?assertMatch("Hello John!!!", gen_server:call(Pid, {say_hi, "John"})),
        ?assertMatch("Hello Alice!!!", gen_server:call(Pid, {say_hi, "Alice"}))
    ].
