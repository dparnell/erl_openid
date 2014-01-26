ERL ?= erl
APP := openid
DEPS_DIR ?= deps

.PHONY: deps
.PHONY: test
.PHONY: mod

all: deps
	@./rebar deps_dir=$(DEPS_DIR) compile

deps:
	@./rebar deps_dir=$(DEPS_DIR) get-deps

clean:
	@./rebar clean

mod:
	@./rebar create-mod app=$(APP) modid=$(MOD)

test:
	@./rebar eunit app=$(APP)

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'
