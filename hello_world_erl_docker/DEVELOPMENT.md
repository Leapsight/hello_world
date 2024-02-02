Development
===

Build
-----

    make compile

Unit Test
---

    make eunit

```shell
> make eunit
rebar3 compile
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
rebar3 as test eunit --verbose
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Performing EUnit tests...
======================== EUnit ========================
file "hello_world.app"
  application 'hello_world'
    module 'hello_server'
    module 'hello_wamp'
    hello_world:30: -do_say_hi_test_/0-fun-1- (module 'hello_world')...ok
    module 'hello_world_app'
    module 'hello_world_sup'
    [done in 0.018 s]
  [done in 0.022 s]
module 'hello_server_SUITE'
=======================================================
  Test passed.

```

Common Tests
---

    make test

```shell
> make test
rebar3 compile
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
rebar3 as test ct --verbose
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Running Common Test suites...

Common Test starting (cwd is /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker)



CWD set to: "/Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/test/logs/ct_run.nonode@nohost.2024-02-02_16.39.11"

TEST INFO: 1 test(s), 1 case(s) in 1 suite(s)

Testing lib.hello_world: Starting test, 1 test cases
%%% hello_server_SUITE: .
Testing lib.hello_world: TEST COMPLETE, 1 ok, 0 failed of 1 test cases

```

Release
---

    make release

```shell
> make release
rebar3 release
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Assembling release hello_world-0.1.0...
===> Release successfully assembled: _build/default/rel/hello_world
```

Run Dev Config
---

    make devrun

```shell
> make devrun
clear
ERL_FLAGS=" -args_file config/dev/vm.args " \
	rebar3 as dev shell
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:10:10] [ds:10:10:10] [async-threads:30] [jit]

Eshell V14.0.2 (press Ctrl+G to abort, type help(). for help)
16:41:01.777 [info] registering procedure uri=<<"com.leapsight.hello.hi">> ...
16:41:01.784 [info] registered reg_id=6118182088244625.
Running hello_server on 'hello@Fernandos-MacBook-Pro.local' :{ok,<0.404.0>}
===> Booted syntax_tools
===> Booted compiler
===> Booted goldrush
===> Booted lager
===> Booted sasl
===> Booted hello_world
(hello@Fernandos-MacBook-Pro.local)1>

```

Run Prod Config
---

    make prodrun

```shell
> make prodrun
clear
rebar3 as prod release
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling hello_world
===> Assembling release hello_world-0.1.0...
===> Both vm_args_src and vm_args are set, vm_args will be ignored
===> Both sys_config_src and sys_config are set, sys_config will be ignored
===> Release successfully assembled: _build/prod/rel/hello_world
LOG_LEVEL=debug \
	WAMP_HOST=Fernandos-MacBook-Pro.local \
	WAMP_PORT=18082 \
	WAMP_ENCODING=json \
	WAMP_REALM="com.leapsight.bondy" \
	SERVICE_NAME=hello_world \
	ERLANG_NODENAME=hello_world-0@Fernandos-MacBook-Pro.local \
	_build/prod/rel/hello_world/bin/hello_world console
Exec: /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world/erts-14.0.2/bin/erlexec -boot /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world/releases/0.1.0/start -mode embedded -boot_var SYSTEM_LIB_DIR /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world/lib -config /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world/releases/0.1.0/sys.config -args_file /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world/releases/0.1.0/vm.args -- console
Root: /Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world
/Users/fcoronel/leapsight/hello_world/hello_world_erl_docker/_build/prod/rel/hello_world
Erlang/OTP 26 [erts-14.0.2] [source] [64-bit] [smp:10:10] [ds:10:10:10] [async-threads:64] [jit]

16:41:43.992 [info] registering procedure uri=<<"com.leapsight.hello.hi">> ...
16:41:43.996 [info] registered reg_id=554836072438999.
Running hello_server on 'hello_world-0@Fernandos-MacBook-Pro.local' :{ok,
                                                                      <0.505.0>}
Eshell V14.0.2 (press Ctrl+G to abort, type help(). for help)
(hello_world-0@Fernandos-MacBook-Pro.local)1>

```


Build Docker Image
---

    make dockerbuild

```shell
> make dockerbuild
docker build --pull --rm --network=host --force-rm \
		-f Dockerfile -t hello_world:dev .
[+] Building 21.4s (17/17) FINISHED                                                                                                                                                                                                                                                                      docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                                                                     0.1s
 => => transferring dockerfile: 606B                                                                                                                                                                                                                                                                                     0.0s
 => [internal] load metadata for docker.io/library/erlang:26-alpine                                                                                                                                                                                                                                                      1.5s
 => [auth] library/erlang:pull token for registry-1.docker.io                                                                                                                                                                                                                                                            0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                                                          0.0s
 => [builder 1/9] FROM docker.io/library/erlang:26-alpine@sha256:66d67ee31901481b58cbb6225b1540867ce0a35077503e891a95f38e791c6b37                                                                                                                                                                                        0.0s
 => => resolve docker.io/library/erlang:26-alpine@sha256:66d67ee31901481b58cbb6225b1540867ce0a35077503e891a95f38e791c6b37                                                                                                                                                                                                0.0s
 => [internal] load build context                                                                                                                                                                                                                                                                                        0.6s
 => => transferring context: 38.12MB                                                                                                                                                                                                                                                                                     0.6s
 => CACHED [builder 2/9] WORKDIR /usr/src/app                                                                                                                                                                                                                                                                            0.0s
 => [builder 3/9] COPY . /usr/src/app/                                                                                                                                                                                                                                                                                   0.8s
 => [builder 4/9] RUN apk update &&     apk upgrade &&     apk add git g++ sudo tcpdump make openssh-client                                                                                                                                                                                                              5.2s
 => [builder 5/9] RUN mkdir /root/.ssh                                                                                                                                                                                                                                                                                   0.1s
 => [builder 6/9] RUN mkdir -p /opt/rel                                                                                                                                                                                                                                                                                  0.0s
 => [builder 7/9] RUN CXXFLAGS="-DOS_LINUX -DLEVELDB_PLATFORM_POSIX" rebar3 as prod tar                                                                                                                                                                                                                                  3.7s
 => [builder 8/9] RUN mkdir -p /opt/rel                                                                                                                                                                                                                                                                                  0.1s
 => [builder 9/9] RUN tar -zxvf /usr/src/app/_build/prod/rel/*/*.tar.gz -C /opt/rel                                                                                                                                                                                                                                      0.1s
 => [release 1/2] WORKDIR /opt/hello_world                                                                                                                                                                                                                                                                               0.0s
 => [release 2/2] COPY --from=builder /opt/rel /opt/hello_world                                                                                                                                                                                                                                                          0.0s
 => exporting to image                                                                                                                                                                                                                                                                                                   9.0s
 => => exporting layers                                                                                                                                                                                                                                                                                                  6.5s
 => => exporting manifest sha256:573740a6ed19f730911fb612349b99d2212376ff90ad72d88f6dfeef0d8c9bf1                                                                                                                                                                                                                        0.0s
 => => exporting config sha256:3628e7ce3772751dfade8567c8aa865f5885e2f93fe61db2c37ad2ddc1a17124                                                                                                                                                                                                                          0.0s
 => => exporting attestation manifest sha256:190d6a794eac56f2ed14e2d50ce5146b533bde656b1eff2943cd6cf14a0f65e6                                                                                                                                                                                                            0.0s
 => => exporting manifest list sha256:97cf6090714123f23a60d512f2ecb157fab9cf26fd6ff58a82fea304b49481de                                                                                                                                                                                                                   0.0s
 => => naming to docker.io/library/hello_world:dev                                                                                                                                                                                                                                                                       0.0s
 => => unpacking to docker.io/library/hello_world:dev                                                                                                                                                                                                                                                                    2.5s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/2enoq052h36gcbps8el1zepg9

What's Next?
  View a summary of image vulnerabilities and recommendations → docker scout quickview

```

## Run Docker Service

    make dockerrun

```shell
> make dockerrun
docker run \
		--network=host \
		--rm \
		-e CLUSTER_NAME="localhost" \
		-e LOG_LEVEL=debug \
		-e REPLICAS=1 \
		-e RIAK_BUCKET_TYPE="resources_type" \
		-e RIAK_HOST="localhost" \
		-e RIAK_PORT=8087 \
		-e WAMP_ENCODING=json \
		-e WAMP_HOST="localhost" \
		-e WAMP_PORT=18082 \
		-e WAMP_REALM="com.leapsight.bondy" \
		-e ERLANG_NODENAME=hello_world-0@localhost \
		--name hello_world \
		hello_world:dev
Exec: /opt/hello_world/erts-14.2.1/bin/erlexec -noinput +Bd -boot /opt/hello_world/releases/0.1.0/start -mode embedded -boot_var SYSTEM_LIB_DIR /opt/hello_world/lib -config /opt/hello_world/releases/0.1.0/sys.config -args_file /opt/hello_world/releases/0.1.0/vm.args -- foreground
Root: /opt/hello_world
/opt/hello_world
19:43:14.791 [info] registering procedure uri=<<"com.leapsight.hello.hi">> ...
Running hello_server on 'hello_world-0@localhost' :{ok,<0.504.0>}
19:43:14.792 [info] registered reg_id=6638908513132129.

```
