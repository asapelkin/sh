# runs all tests on all envs, in parallel
.PHONY: test
test: build_test_image
	docker run -it --rm -v $(shell pwd):/home/shtest/sh amoffat/shtest tox -p

# one test on all envs, in parallel
.PHONY: test_one
test_one: build_test_image
	docker run -it --rm -v $(shell pwd):/home/shtest/sh amoffat/shtest tox -p -- $(test)

.PHONY: build_test_image
build_test_image:
	docker build -t amoffat/shtest -f tests/Dockerfile --build-arg cache_bust=948 tests/

# publishes to PYPI
.PHONY: release
release:
	poetry publish --dry-run