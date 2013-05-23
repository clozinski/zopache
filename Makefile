PYTHON = python2.7
PASTERARGS =
scripts = bin/test bin/python bin/paster

.PHONY: default
default: all

.PHONY: help
help:
	@echo "make            -- build everything that needs building"
	@echo "make test       -- run all tests"
	@echo "make debug-run  -- run server in foreground mode"
	@echo "make run        -- run server in foreground mode"
	@echo "make start      -- start server in the background"
	@echo "make stop       -- stop server"

.PHONY: all
all: $(scripts)

.PHONY: debug-run
debug-run: run-prereqs
	bin/paster serve debug.ini $(PASTERARGS)

.PHONY: run
run: run-prereqs
	bin/paster serve deploy.ini $(PASTERARGS)

.PHONY: start
start: run-prereqs
	bin/paster serve deploy.ini --daemon $(PASTERARGS)

.PHONY: stop
stop: run-prereqs
	bin/paster serve deploy.ini --stop-daemon $(PASTERARGS)

.PHONY: test
test: test-prereqs
	bin/test -c 2>&1 | less -RFX

.PHONY: run-prereqs
run-prereqs: bin/paster

.PHONY: test-prereqs
test-prereqs: bin/test

bin/buildout: bootstrap.py
	$(PYTHON) bootstrap.py
	touch -c bin/buildout

$(scripts): bin/buildout buildout.cfg setup.py .git/HEAD
	bin/buildout -N
	touch -c $(scripts)
