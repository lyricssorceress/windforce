%%%-------------------------------------------------------------------
%%% @author lc
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Sep 2018 15:32
%%%-------------------------------------------------------------------
-author("lc").

-define(GET_APP_ENV(Key, Default_Value), application:get_env(application:get_application(), Key, Default_Value)).

-define(SUP_FLAGS_ONE_FOR_ONE, #{strategy => one_for_one, intensity => ?MAX_INTENSITY, period => ?MAX_PERIOD}).

-define(SUP_FLAGS_SIMPLE_ONE_FOR_ONE, #{strategy => simple_one_for_one, intensity => ?MAX_INTENSITY, period => ?MAX_PERIOD}).

-define(CHILD_SPEC_WORKER(Module, Args), #{id => Module,
                                      start =>{Module, start_link, Args}, %% [Arg1, Arg2] 会调用start_link(Args1, Args2)
                                      restart => transient,
                                      shutdown => 2000,
                                      type => worker,
                                      modules => [Module]}).
-define(CHILD_SPEC_TEMP_WORKER(Module, Args), #{id => Module,
                                      start =>{Module, start_link, Args},
                                      restart => temporary,
                                      shutdown => 2000,
                                      type => worker,
                                      modules => [Module]}).

-define(CHILD_SPEC_SUPERVISOR(Module, Sup_Name, Args), #{id => Sup_Name,
                                                          start =>{Module, start_link, [Sup_Name |Args]},
                                                          restart => transient,
                                                          shutdown => infinity,
                                                          type => supervisor,
                                                          modules => [Module]}).

-define(START_SUPERVISOR, "").

-define(MAX_INTENSITY, 1000).

-define(MAX_PERIOD, 3600).

-define(PROCESS_NAME(NameSpace, Name), list_to_atom(mara_utils:any_to_list(NameSpace) ++ "_" ++ integer_to_list(erlang:phash2(Name)))).



