#!/bin/bash

echo "cool-guy easy tor setup..."

# Function to start Tor
function startTor() {
  if ! [ -d "./tor" ]; then
    mkdir ./tor 2>/dev/null
  fi
  tor -f ./.torrc &
}

# Function to start the server (Node.js)
function server() {
  if ! [ -f "./package.json" ]; then
    echo "No package.json found, running npm install..."
    npm install
  fi
  echo "Starting Node.js server..."
  npm start
}

# Function to run both services
function run() {
  echo "Starting services..."

  # Start the Node.js server in the background
  server &

  # Start Tor
  startTor

  # Optionally, wait for both processes to finish (if needed)
  wait
}

# Call the run function
run
