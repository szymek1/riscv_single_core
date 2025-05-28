#! /bin/bash


# List of directories to remove
dirs=(
  "rv32i_sc.cache/"
  "rv32i_sc.hw/"
  "rv32i_sc.ip_user_files/"
  "rv32i_sc.sim/"
)

for dir in "${dirs[@]}"; do
  if [ -d "$dir" ]; then
    rm -r "$dir"
    echo "Removed: $dir"
  else
    echo "Skipped (not found): $dir"
  fi
done
