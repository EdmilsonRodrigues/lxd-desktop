.PHONY: setup
setup: install-uv sync-dependencies

.PHONY: sync-dependencies
sync-dependencies:
	uv sync --all-groups

.PHONY: full-lint
full-lint: lint static 

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

.PHONY: install-uv
install-uv:
ifneq ($(shell which uv),)
else ifneq ($(shell which snap),)
        sudo snap install --classic astral-uv
else ifneq ($(shell which brew),)
        brew install uv
else ifeq ($(OS),Windows_NT)
        pwsh -c "irm https://astral.sh/uv/install.ps1 | iex"
else
        curl -LsSf https://astral.sh/uv/install.sh | sh
endif
