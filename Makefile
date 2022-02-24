MIX_ENV ?= prod

export MIX_ENV

all:
	mix release --overwrite

prepare:
	mix local.hex --if-missing --force
	mix local.rebar --if-missing --force
	mix deps.get

rel: prepare all
