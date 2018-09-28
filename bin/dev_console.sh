#!/bin/bash
# -config app.config -config app.last.config \

erl -pa ./ebin/ -boot start_sasl -pa deps/*/ebin -config app.config +P 3000000 -name chen@pilot.skye.gem -mnesia dir mnesia -s lager
#erl -pa ./ebin/ -boot start_sasl -pa deps/*/ebin -config app.config +P 3000000 -name leon@pilot.skye.gem -mnesia dir '"/Users/lc/lab/mnesia"' -s lager


