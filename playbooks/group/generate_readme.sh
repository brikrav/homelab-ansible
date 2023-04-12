#!/bin/bash

# Save the current directory's basename into a variable
current_dir_basename=$(basename "$(pwd)")

# Create a new README.md file or clear the existing one
echo "# commands - $current_dir_basename" > README.md
echo "" >> README.md

# Loop through all .yml files in the current directory
for file in *.yml; do
  # Check if the file exists (in case there are no .yml files)
  if [[ -e $file ]]; then
    # Save the file basename without the .yml extension into a variable
    file_basename=$(basename "$file" .yml)
    
    # Print the file_basename
    echo "Processing: $file_basename"

    # Write the formatted file information to the README.md file
    echo "## $file_basename" >> README.md
    echo -e '```bash' >> README.md
    echo "ansible-playbook -i hosts.ini -v --extra-vars \"@bri-secrets.yml\" $current_dir_basename/$file" >> README.md
    echo -e '```' >> README.md
    echo "" >> README.md
  fi
done
