#!/bin/bash

# Check if createtf.sh exists in the current directory
if [ ! -f "createtf.sh" ]; then
  echo "createtf.sh not found in the current directory. Please ensure the script is present."
  exit 1
fi

# Make createtf.sh executable
chmod +x createtf.sh
echo "Made createtf.sh executable."

# Move or replace createtf to /usr/local/bin
if [ -f "/usr/local/bin/createtf" ]; then
  echo "/usr/local/bin/createtf already exists. Replacing it with the new version."
else
  echo "Moving createtf.sh to /usr/local/bin/createtf."
fi

# Move createtf.sh to /usr/local/bin/createtf
sudo mv createtf.sh /usr/local/bin/createtf

# Confirm the move
if [ $? -eq 0 ]; then
  echo "createtf successfully installed at /usr/local/bin/createtf."
else
  echo "Failed to install createtf. Please check your permissions."
  exit 1
fi

