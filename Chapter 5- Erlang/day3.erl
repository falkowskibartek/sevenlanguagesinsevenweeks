-module(day3).
-export([loop/0]).

loop() ->
    process_flag(trap_exit,true),
    receive
        {monitor, Process} ->
            link(Process),
            io:format("Monitoring process.~n"),
            loop();

        {'EXIT', From, Reason} ->
            io:format("The process ~p died with reason ~p", [From, Reason]),
            loop()
        end.