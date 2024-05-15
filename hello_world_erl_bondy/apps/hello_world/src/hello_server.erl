%%%-------------------------------------------------------------------
%%% @author fcoronel
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%% @end
%%%-------------------------------------------------------------------
-module(hello_server).

-behaviour(gen_server).

-export([start_link/0, stop/0]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-export([say_hi/1]).

-define(SERVER, ?MODULE).

-record(hello_state, {count = 0 :: integer()}).

%%%===================================================================
%%% Spawning and gen_server implementation
%%%===================================================================

start_link() ->
  Res = gen_server:start_link({local, ?SERVER}, ?MODULE, [], []),
  io:format("Running ~p on ~p :~p~n", [?SERVER, node(), Res]),
  Res.

stop() ->
  gen_server:cast(?MODULE, stop).

init([]) ->
  {ok, #hello_state{}}.

handle_call({say_hi, Name}, _From, State = #hello_state{}) ->
  Message = hello_world:say_hi(Name),
  io:format("~p message: ~s~n", [?MODULE, Message]),
  NewState = State#hello_state{count = State#hello_state.count + 1},
  {reply, Message, NewState}.

handle_cast(stop, State = #hello_state{}) ->
  {stop, normal, State};
handle_cast(_Request, State = #hello_state{}) ->
  {noreply, State}.

handle_info(_Info, State = #hello_state{}) ->
  {noreply, State}.

terminate(_Reason, _State = #hello_state{}) ->
  io:format("~p executed terminate: (~p,~p)~n", [?MODULE, _Reason, _State]),
  ok.

code_change(_OldVsn, State = #hello_state{}, _Extra) ->
  {ok, State}.

say_hi(Name) ->
  gen_server:call(?SERVER, {say_hi, Name}).

%%%===================================================================
%%% Internal functions
%%%===================================================================
