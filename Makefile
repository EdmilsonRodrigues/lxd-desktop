.PHONY: lint
lint:
	uv run ruff check src/

.PHONY: format
format:
	uv run ruff format src/
	uv run ruff check --fix src/
	uv run ruff format src/

.PHONY: format-tests
format-tests:
	uv run ruff format tests/
	uv run check --fix tests/
	uv run ruff format tests/

.PHONY: static
static:
	uv run mypy src/

.PHONY: test
test:
	uv run pytest

.PHONY: dev
dev:
	cd src && uv run -m lxd_desktop

