#!/bin/bash

# Define paths
BUILD_ZIP="build.zip"
BUILD_DIR="build"

# Check if unzip is installed
if ! command -v unzip &> /dev/null
then
    echo "unzip could not be found, please install it."
    exit
fi

# Clean up any existing build directory
if [ -d "$BUILD_DIR" ]; then
    echo "Cleaning up existing build directory..."
    rm -rf "$BUILD_DIR"
fi

# Create the build directory
mkdir -p "$BUILD_DIR"

# Unzip the build.zip file directly into the build directory
echo "Unzipping $BUILD_ZIP..."
unzip -q "$BUILD_ZIP" -d "$BUILD_DIR"

# Serve the application
echo "Starting server..."
PORT=5001 npx serve -s "$BUILD_DIR"
