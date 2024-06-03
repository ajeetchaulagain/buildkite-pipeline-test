#!/bin/bash

# Retrieve the environment from the script arguments
env=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --env) env="$2"; shift ;;
    esac
    shift
done

echo "Deploying to $env..."

# Add your deployment logic here

echo "Deployment to $env completed."
