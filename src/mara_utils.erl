%%%-------------------------------------------------------------------
%%% @author lc
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Sep 2018 20:53
%%%-------------------------------------------------------------------
-module(mara_utils).
-author("lc").

%% API
-export([any_to_list/1]).

any_to_list(undefined) ->
  "";
any_to_list(List) when is_list(List) ->
  List;
any_to_list(Bin) when is_binary(Bin) ->
  case unicode:characters_to_binary(Bin, utf8, utf8) of
    Bin -> unicode:characters_to_list(Bin);
    _ -> binary_to_list(Bin)
  end;
any_to_list(Atom) when is_atom(Atom) ->
  atom_to_list(Atom);
any_to_list(Number) when is_integer(Number) ->
  integer_to_list(Number);
any_to_list(Number) when is_float(Number) ->
  float_to_list(Number);
any_to_list(_) ->
  throw(badarg).


process_name(Namespace, Name) ->
  list_to_atom(any_to_list(Namespace) ++ "_" + integer_to_list(phash2(Name))).
