#!/bin/bash

# Cleanup function to remove created files on error
cleanup() {
    echo "Cleaning up due to failed installation..."
    rm -rf node_modules/ package-lock.json yarn.lock
    if [[ -f "rollback.json" ]]; then
        mv rollback.json package.json
    fi
    exit 1
}

trap cleanup ERR

# Get the directory where the script is being executed from
TARGET_DIR=$(pwd)
DIR_NAME=$(basename "$TARGET_DIR")

# Special directory checks with custom error messages
if [[ "$DIR_NAME" == "mobile" ]]; then
    echo "Error: Mobile apps should be created with 'npx create-expo-app@latest'" >&2
    exit 1
elif [[ "$DIR_NAME" == "server" ]]; then
    echo "Error: Servers should be created via Python FastAPI or NodeJS Express" >&2
    exit 1
fi

# Backup package.json if exists
if [[ -f "package.json" ]]; then
    cp package.json rollback.json
fi

# Create React App
echo "Creating React app in $TARGET_DIR..."
npx create-react-app@latest . || {
    echo "Failed to create React app" >&2
    cleanup
}

# Remove unnecessary CRA files
echo "Cleaning up unnecessary files..."
rm -f README.md src/logo.svg src/App.test.js src/reportWebVitals.js src/setupTests.js

# Install dependencies based on project type
echo "Installing dependencies..."
if [[ "$DIR_NAME" == "desktop" ]]; then
    # Desktop-specific dependencies
    npm install --save-dev electron electron-builder tailwindcss@3 || cleanup
    npm install --save \
      @fortawesome/fontawesome-svg-core \
      @fortawesome/free-solid-svg-icons \
      @fortawesome/react-fontawesome \
      axios \
      concurrently \
      cross-env \
      react-router-dom \
      wait-on || cleanup
    
    # Initialize TailwindCSS
    npx tailwindcss init -p || cleanup
    
    # Clean up Electron-generated files
    rm -f public/electron.js

elif [[ "$DIR_NAME" == "web" ]]; then
    # Web-specific dependencies
    npm install --save-dev tailwindcss@3 || cleanup
    npm install --save \
      @fortawesome/fontawesome-svg-core \
      @fortawesome/free-solid-svg-icons \
      @fortawesome/react-fontawesome \
      axios \
      react-router-dom || cleanup
    
    # Initialize TailwindCSS
    npx tailwindcss init -p || cleanup
fi

# Final cleanup
rm -f rollback.json 2>/dev/null

echo -e "\nSuccess! Project created in $TARGET_DIR"
echo "Next steps:"
if [[ "$DIR_NAME" == "desktop" ]]; then
    echo "1. Configure Electron (see documentation)"
    echo "2. Run: npm run electron:dev"
else
    echo "1. Run: npm start"
fi