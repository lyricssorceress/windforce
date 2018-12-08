%%%-------------------------------------------------------------------
%%% @author lc
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Dec 2018 15:14
%%%-------------------------------------------------------------------
-module(windforce_app).
-author("lc").

%% API
-export([start/0]).

start() ->
  windforce_sup:start_link().