HOSTNAME := $(shell hostname)
REBAR=rebar3

all: release

clean:
	rm -rf _build

.PHONY: compile
compile:
	${REBAR} compile

eunit: compile
	${REBAR} as test eunit --verbose

test: compile
	${REBAR} as test ct --verbose

release:
	${REBAR} release

devrun:
	clear
	ERL_FLAGS=" -args_file config/dev/vm.args " \
	${REBAR} as dev shell

prodrun:
	clear
	${REBAR} as prod release
	LOG_LEVEL=debug \
	WAMP_HOST=localhost \
	WAMP_PORT=18082 \
	WAMP_ENCODING=json \
	WAMP_REALM="com.bondy.demo.hello" \
	WAMP_CALL_TIMEOUT="10000" \
	WAMP_RECONNECT_RETRIES="10" \
	WAMP_RECONNECT_MAX_RETRIES="30" \
	WAMP_RECONNECT_BACKOFF_MIN="200" \
	WAMP_RECONNECT_BACKOFF_MAX="60000" \
	WAMP_RECONNECT_BACKOFF_TYPE="jitter" \
	SERVICE_NAME=hello_world \
	ERLANG_NODENAME=hello_world-0@${HOSTNAME} \
	_build/prod/rel/hello_world/bin/hello_world console

dockerbuild:
	docker build --pull --rm --network=host --force-rm \
		-f Dockerfile -t hello_world:dev .

dockerrun:
	docker run \
		--network=host \
		--rm \
		-e LOG_LEVEL=debug \
		-e REPLICAS=1 \
		-e WAMP_ENCODING=json \
		-e WAMP_HOST="localhost" \
		-e WAMP_PORT=18082 \
		-e WAMP_REALM="com.leapsight.bondy" \
		-e WAMP_CALL_TIMEOUT="10000" \
		-e WAMP_RECONNECT_RETRIES="10" \
		-e WAMP_RECONNECT_MAX_RETRIES="30" \
		-e WAMP_RECONNECT_BACKOFF_MIN="200" \
		-e WAMP_RECONNECT_BACKOFF_MAX="60000" \
		-e WAMP_RECONNECT_BACKOFF_TYPE="jitter" \
		-e ERLANG_NODENAME=hello_world-0@localhost \
		--name hello_world \
		hello_world:dev

docker: dockerbuild dockerrun
