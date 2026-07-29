SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

.DEFAULT_GOAL := help

help: ## Affiche les commandes disponibles
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS=":.*?## "}; {printf "%-12s %s\n", $$1, $$2}'

lint: ## Lance pre-commit
	python -m pre_commit run --all-files

secrets: ## Recherche les secrets
	python -m pre_commit run gitleaks --all-files

clean: ## Nettoyage
	rm -rf .pytest_cache
