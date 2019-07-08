PROJECT = emqx_redis
PROJECT_DESCRIPTION = EMQX REDIS
PROJECT_VERSION = 3.0

DEPS = eredis ecpool
dep_eredis = git-emqx https://github.com/emqx/eredis 1.1.0
dep_ecpool = git-emqx https://github.com/emqx/ecpool v0.3.0

BUILD_DEPS = emqx cuttlefish
dep_emqx = git-emqx https://github.com/emqx/emqx emqx30
dep_cuttlefish = git-emqx https://github.com/emqx/cuttlefish v2.2.1

COVER = true

$(shell [ -f erlang.mk ] || curl -s -o erlang.mk https://raw.githubusercontent.com/emqx/erlmk/master/erlang.mk)
include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emqx_redis.conf -i priv/emqx_redis.schema -d data
