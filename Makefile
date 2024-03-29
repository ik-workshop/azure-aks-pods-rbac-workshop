.EXPORT_ALL_VARIABLES:

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup dependencies
	@brew bundle

hooks: ## install pre commit.
	@pre-commit install
	@pre-commit gc
	@pre-commit autoupdate

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

changelog: ## Update changelog
	@git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release: ## Create release version
	@semtag final -s minor

tfm-platform: ## Step 1. Deploy base. Networking & Kubernetes
	@envchain az bin/az.terraform.base.sh apply