SPEC_FILES := $(wildcard ./*.json)
OTHER_SPEC_FILES := $(wildcard ./other/*.json)


OUTPUTS := $(patsubst ./%.json,./out/%.html,$(SPEC_FILES))
OTHER_OUTPUTS := $(patsubst ./other/%.json,./out/other/%.html,$(OTHER_SPEC_FILES))


all: setup $(OUTPUTS) $(OTHER_OUTPUTS)

./out/%.html : ./%.json
	$(info ** PROCESSING $<)
	redoc-cli build $<
	mv redoc-static.html $@

./out/other/%.html : ./other/%.json
	$(info ** PROCESSING: $<)
	redoc-cli build $<
	mv redoc-static.html $@

setup:
	mkdir -p out/other

clean:
	rm -rf out