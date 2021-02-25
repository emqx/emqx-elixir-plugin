
PATH := $(CURDIR)/elixir/bin:$(PATH)


all: elixir/lib/elixir/ebin/elixir.app
	mix local.hex --force
	mix local.rebar --force
	mix deps.get
	mix compile
	-rm -rf $(CURDIR)/elixir/lib/mix/test

elixir/lib/elixir/ebin/elixir.app:
	git clone -b v1.6.5 --depth 1 https://github.com/elixir-lang/elixir.git
	echo "start to build elixir ..."
	make -C elixir -f Makefile

distclean:
	@rm -rf _build/
	@rm -rf deps/
	@rm -rf
