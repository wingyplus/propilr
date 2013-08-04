#!/bin/bash

erl -pa ebin deps/*/ebin -s propilr \
    -eval "io:format(\"Point your browser at http://localhost:8000~n\")"
