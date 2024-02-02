FROM erlang:26-alpine as builder

WORKDIR /usr/src/app
COPY . /usr/src/app/

RUN apk update && \
    apk upgrade && \
    apk add git g++ sudo tcpdump make openssh-client

RUN mkdir /root/.ssh
RUN mkdir -p /opt/rel
RUN CXXFLAGS="-DOS_LINUX -DLEVELDB_PLATFORM_POSIX" rebar3 as prod tar

RUN mkdir -p /opt/rel
RUN tar -zxvf /usr/src/app/_build/prod/rel/*/*.tar.gz -C /opt/rel


FROM builder as release

WORKDIR /opt/hello_world

ENV RELX_REPLACE_OS_VARS true

COPY --from=builder /opt/rel /opt/hello_world

ENTRYPOINT ["/opt/hello_world/bin/hello_world", "foreground"]
