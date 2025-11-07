# =============================================================================
# justfile: A makefile like build script -- Command Runner
# =============================================================================

set export := true


# List all available just commands
list:
    just -l

# Build the template
bake:
    rm -rf airpackage
    uv run cookiecutter --no-input .

# Check for lint and format violations in the built template
lint: 
    uv run ruff check --diff airpackage
    uv run ruff format --diff airpackage

# Bake the template and diff on changes
qa:
    just bake
    just lint
