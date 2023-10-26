Development
===

Build
-----

    rebar3 compile

Test
---

    rebar3 eunit

```shell
❯ rebar3 eunit
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Performing EUnit tests...
.
Finished in 0.027 seconds
1 tests, 0 failures
```

Common Tests
---

    rebar3 ct --verbose

```shell
❯ rebar3 ct --verbose
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
test/hello_server_SUITE.erl:12:2: Warning: export_all flag enabled - all functions will be exported

===> Running Common Test suites...

Common Test starting (cwd is /Users/fcoronel/playground/hello-world/hello_world_erl)



CWD set to: "_build/test/logs/ct_run.nonode@nohost.2023-10-25_23.22.40"

TEST INFO: 1 test(s), 1 case(s) in 1 suite(s)

Testing lib.hello_world: Starting test, 1 test cases
%%% hello_server_SUITE: .
Testing lib.hello_world: TEST COMPLETE, 1 ok, 0 failed of 1 test cases

Updating _build/test/logs/index.html ... done
Updating _build/test/logs/all_runs.html ... done
```

Release
---

    rebar3 release

```shell
❯ rebar3 release
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Assembling release hello_world-0.0.1...
===> Release successfully assembled: _build/default/rel/hello_world
```
