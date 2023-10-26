# Hello World

Simple App that prints "Hello World!!!" on startup and provides a module 
`hello_world` with a single function `say_hi/1` that builds a 
`Hello {Param}!!!` message. 

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

Run
---

    _build/default/rel/hello_world/bin/hello_world foreground
    
```shell
❯ _build/default/rel/hello_world/bin/hello_world foreground
Exec: _build/default/rel/hello_world/releases/0.0.1/vm.args -- foreground
Root: _build/default/rel/hello_world
_build/default/rel/hello_world
Hello World!!!
^C
```

