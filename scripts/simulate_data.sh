#!/bin/bash

# simulate_data.sh - Runs the IoT sensor data simulation

# Exit on error
set -e

# Variables
SIMULATION_SCRIPT="../src/iot/simulate_sensors.py"
PYTHON_CMD="python3"  # Use 'python' if that's your default Python 3 command

# Check if Python is installed
command -v "$PYTHON_CMD" >/dev/null 2>&1 || { echo "Python 3 is required but not installed. Aborting."; exit 1; }

# Check if the simulation script exists
if [ ! -f "$SIMULATION_SCRIPT" ]; then
  echo "Error: Simulation script ($SIMULATION_SCRIPT) not found!"
  exit 1
fi

echo "Starting IoT data simulation..."

# Activate virtual environment (optional, uncomment if using one)
# source venv/bin/activate

# Install dependencies (optional, add if simulate_sensors.py needs any)
# pip install -r ../src/iot/requirements.txt

# Run the simulation
"$PYTHON_CMD" "$SIMULATION_SCRIPT"

echo "Simulation stopped."
