#!/bin/bash

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository."
    exit 1
fi

# Starting date (August 2022)
START_YEAR=2022
START_MONTH=8

# Get today's year and month
CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%-m)

# Initialize year and month variables
year=$START_YEAR
month=$START_MONTH

echo "Commits containing 'Regen PDF' per month (case-insensitive):"

# Initialize totals
grand_total=0

# Iterate through each month from the start date to the current date
while [ $year -lt $CURRENT_YEAR ] || [ $year -eq $CURRENT_YEAR -a $month -le $CURRENT_MONTH ]; do
    # Format the month with leading zero if needed
    formatted_month=$(printf "%02d" $month)
    
    # Get the start and end date for the month
    start_date="$year-$formatted_month-01"
    end_date=$(date -d "$start_date +1 month -1 day" +%Y-%m-%d)

    # Count commits containing "Regen PDF" in the given month
    count=$(git log --since="$start_date" --until="$end_date" --grep="Regen PDF" --grep="regen pdf" --grep="REGEN PDF" --grep="ReGen Pdf" --oneline | wc -l)
    
    # Accumulate the total for the current year
    ((year_total += count))
    ((grand_total += count))
    
    # Print the result, grouped by year
    if [ $month -eq 1 ] || [ $year -eq $START_YEAR -a $month -eq $START_MONTH ]; then
        if [ $month -ne $START_MONTH ]; then
            echo "  Total for $((year - 1)): $year_total"
            year_total=0
        fi
        echo ""
        echo "$year:"
    fi
    echo "  $formatted_month: $count"

    # Increment month and handle year rollover
    month=$((month + 1))
    if [ $month -gt 12 ]; then
        month=1
        year=$((year + 1))
    fi
done

# Print the total for the last year
echo "  Total for $((year - 1)): $year_total"

# Print the grand total
echo ""
echo "Grand Total: $grand_total"

