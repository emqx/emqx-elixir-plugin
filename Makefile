
PATH := $(CURDIR)/elixir/bin:$(PATH)


all: elixir/lib/elixir/ebin/elixir.app
	mix local.hex
	mix deps.get
	mix compile
	-rm -rf $(CURDIR)/elixir/lib/mix/test
	mkdir -p ../elixir
	mkdir -p ../logger
	cp -rf $(CURDIR)/elixir/lib/elixir/ebin ../elixir/
	cp -rf $(CURDIR)/elixir/lib/logger/ebin ../logger/
	
	
elixir/lib/elixir/ebin/elixir.app:
	git clone https://github.com/elixir-lang/elixir.git
	echo "start to build elixir ..."
	make -C elixir -f Makefile