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


## Run OTP Service

#### 1. Start the service & the client and confirm the connectivity
<table>
<tr>
<th>hello_server</th>
<th>User</th>
</tr>
<tr>
<td id="shell1">

```shell
❯ _build/default/rel/hello_world/bin/hello_world foreground
Exec: [***]
Root: [***]
_build/default/rel/hello_world
Running hello_server on 'hello@Fernandos-MBP.fibertel.com.ar' :{ok,<0.282.0>}






```

</td>
<td id="shell2">

```shell

❯ erl -name client_node -setcookie hello
Erlang/OTP 26 [****]

Eshell V14.0.2 (press Ctrl+G to abort, type help(). for help)
(client_node@Fernandos-MBP.fibertel.com.ar)1> ServerNode='hello@Fernandos-MBP.fibertel.com.ar'.
'hello@Fernandos-MBP.fibertel.com.ar'

(client_node@Fernandos-MBP.fibertel.com.ar)2> net_adm:ping(ServerNode).
pong

```
</td>
</tr>
</table>


#### 2. Called `say_hi`


<table>
<tr>
<th>hello_server</th>
<th>User</th>
</tr>
<tr>
<td id="shell1">

```shell
❯ _build/default/rel/hello_world/bin/hello_world foreground
Exec: [***]
Root: [***]
_build/default/rel/hello_world
Running hello_server on 'hello@Fernandos-MBP.fibertel.com.ar' :{ok,<0.282.0>}










hello_server message: Hello John!!!


```

</td>
<td id="shell2">

```shell

❯ erl -name client_node -setcookie hello
Erlang/OTP 26 [****]

Eshell V14.0.2 (press Ctrl+G to abort, type help(). for help)
(client_node@Fernandos-MBP.fibertel.com.ar)1> ServerNode='hello@Fernandos-MBP.fibertel.com.ar'.
'hello@Fernandos-MBP.fibertel.com.ar'

(client_node@Fernandos-MBP.fibertel.com.ar)2> net_adm:ping(ServerNode).
pong

(client_node@Fernandos-MBP.fibertel.com.ar)3> Pid={hello_server, ServerNode}.
{hello_server,'hello@Fernandos-MBP.fibertel.com.ar'}

(client_node@Fernandos-MBP.fibertel.com.ar)4> gen_server:call( Pid,{say_hi, "John"}).
"Hello John!!!"


```
</td>
</tr>
</table>
