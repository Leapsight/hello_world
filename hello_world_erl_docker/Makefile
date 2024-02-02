HOSTNAME := $(shell hostname)
REBAR=rebar3
SERVICE_NAME=hello_world

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
	WAMP_HOST=${HOSTNAME} \
	WAMP_PORT=18082 \
	WAMP_ENCODING=json \
	WAMP_REALM="com.leapsight.bondy" \
	SERVICE_NAME=${SERVICE_NAME} \
	ERLANG_NODENAME=${SERVICE_NAME}-0@${HOSTNAME} \
	_build/prod/rel/${SERVICE_NAME}/bin/${SERVICE_NAME} console

dockerbuild:
	docker build --pull --rm --network=host --force-rm \
		-f Dockerfile -t ${SERVICE_NAME}:dev .

dockerrun:
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
		-e ERLANG_NODENAME=${SERVICE_NAME}-0@localhost \
		--name ${SERVICE_NAME} \
		${SERVICE_NAME}:dev

docker: dockerbuild dockerrun