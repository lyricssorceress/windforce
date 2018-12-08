%%%-------------------------------------------------------------------
%%% @author lc
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Oct 2018 16:55
%%%-------------------------------------------------------------------
-author("lc").

-define(CREATE_TABLE(Table, Record, Storage, NodeList, Type, IndexList), mnesia:create_table(Table, [{Storage, NodeList}, {attributes, record_info(fields, Record)}, {type, Type}, {index, IndexList}])).
-define(CREATE_TABLE(Table, Record), ?CREATE_TABLE(Table, Record, disc_copies, [node()], set, [])).
-define(CREATE_TABLE(Table), ?CREATE_TABLE(Table, Table, disc_copies, [node()], set, [])).
-define(CREATE_TABLE_WITH_INDEX(Table, IndexList), ?CREATE_TABLE(Table, Table, disc_copies, [node()], set, IndexList)).
%%-define(CREATE_TABLE(Table_Name, Node_List),
%%  mnesia:create_table(Table_Name, [{ram_copies, Node_List}, {type, set}, {attributes, record_info(fields, Table_Name)}])).

-define(ETS_CREATE_TABLE(Table), ets:new(pilot, [set, protected, named_table, {keypos, 1}])).
-define(ETS_CREATE_TABLE(Table, KeyPos), ets:new(pilot, [set, protected, named_table, {keypos, KeyPos}])).