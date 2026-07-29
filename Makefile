SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

.DEFAULT_GOAL := help

help: ## Affiche les commandes disponibles
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS=":.*?## "}; {printf "%-12s %s\n", $$1, $$2}'

lint: ## Lance pre-commit
	pre-commit run --all-files

secrets: ## Recherche les secrets
	gitleaks detect --source . --verbose

clean: ## Nettoyage
	rm -rf .pytest_cache
