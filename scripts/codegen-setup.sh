#!/bin/bash

# This script is executed by the Codegen agent in its secure sandbox
# to prepare the environment for the project.

set -e # Exit immediately if a command exits with a non-zero status.

echo "--- Setting up Node.js environment ---"

# Although the sandbox has nvm, it's good practice to specify the version
# you want to use, in case the default differs.
# nvm use 18 # Example if you need a specific version

echo "--- Installing project dependencies ---"

# Using npm ci is recommended for CI environments as it uses the package-lock.json
# to ensure a clean, reproducible build.
npm ci

echo "--- Environment setup complete. ---"
