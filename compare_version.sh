#!/bin/bash

FILE1="hcipoc_list.txt"
FILE2="scint_list.txt"

declare -A file1_versions
declare -A file2_versions

# Function to compare two versions
compare_versions() {
    awk -v v1="$1" -v v2="$2" 'BEGIN {
        split(v1, a, "."); split(v2, b, ".");
        for (i=1; i<=3; i++) {
            if (a[i] + 0 > b[i] + 0) exit 1; # v1 is greater
            if (a[i] + 0 < b[i] + 0) exit 2; # v2 is greater
        }
        exit 0; # Equal versions
    }'
    case $? in
        1) echo "higher" ;;  # v1 is greater
        2) echo "lower"  ;;  # v2 is greater
        0) echo "equal"  ;;  # Versions are equal
    esac
}

# Read file1 into an associative array
while read -r service version; do
    [[ -n "$service" && -n "$version" ]] && file1_versions["$service"]="$version"
done < "$FILE1"

# Read file2 into an associative array
while read -r service version; do
    [[ -n "$service" && -n "$version" ]] && file2_versions["$service"]="$version"
done < "$FILE2"

# Compare versions and print services in file2 with higher versions
for service in "${!file2_versions[@]}"; do
    if [[ -z "${file1_versions[$service]}" ]]; then
        # Service is only in file2, consider it as higher
        echo "$service ${file2_versions[$service]}"
    else
        # Compare versions
        result=$(compare_versions "${file1_versions[$service]}" "${file2_versions[$service]}")
        if [[ "$result" == "lower" ]]; then
            echo "$service ${file2_versions[$service]}"
        fi
    fi
done 

