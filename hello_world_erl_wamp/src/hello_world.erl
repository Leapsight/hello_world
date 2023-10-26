%%%-------------------------------------------------------------------
%%% @author fcoronel
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Sep 2023 14:46
%%%-------------------------------------------------------------------
-module(hello_world).
-author("fcoronel").

%% API
-export([say_hi/1]).

say_hi(Str) when is_list(Str), is_integer(hd(Str)) ->
    do_say_hi(Str);
say_hi([H])  ->
    say_hi(H);
say_hi([_H | _T] = Names ) ->
    [ say_hi(Str) || Str <- Names].
do_say_hi(Name) ->
    "Hello " ++ Name ++ "!!!".


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

do_say_hi_test_() ->
    [
        ?_assertEqual("Hello World!!!", do_say_hi("World"))
    ].
-endif.
