-module(propilr_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
            {'_', [
                    {"/", cowboy_static, [
                            {directory, {priv_dir, propilr, []}},
                            {file, <<"index.html">>},
                            {mimetypes, [
                                    {<<".html">>, [<<"text/html">>]}
                            ]}
                    ]},
                    {"/assets/[...]", cowboy_static, [
                            {directory, {priv_dir, propilr, [<<"assets">>]}},
                            {mimetypes, [
                                    {<<".css">>, [<<"text/css">>]},
                                    {<<".js">>, [<<"application/javascript">>, <<"text/javascript">>]}
                            ]}
                    ]}
            ]}
    ]),
    cowboy:start_http(propilr_http, 100,
        [{port, 8000}],
        [{env, [{dispatch, Dispatch}]}]
    ),
    propilr_sup:start_link().

stop(_State) ->
    ok.
