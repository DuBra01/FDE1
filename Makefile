.PHONY: help setup check nb

help:
	@echo "setup     install the environment (uv sync)"
	@echo "check     verify your machine is ready for the cohort"
	@echo "nb F=path open a notebook in its own sandbox (no root env needed)"

setup:
	uv sync

# The same checks the environment notebook runs, without needing marimo.
check:
	@bash 00_Prerequisites/scripts/setup_check.sh

# Open any notebook standalone, using only its PEP 723 inline dependencies.
#   make nb F=01_Product_Engineering/sessions/S1_Enterprise_Dev_Environment.py
nb:
	uv run marimo edit --sandbox $(F)
