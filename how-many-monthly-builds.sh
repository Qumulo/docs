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

echo "Commits by 'Michael G. Khmelnitsky' or 'Lucía M. Polis' per month:"

# Initialize totals
grand_total=0
grand_months=0

# Iterate through each month from the start date to the current date
while [ $year -lt $CURRENT_YEAR ] || [ $year -eq $CURRENT_YEAR -a $month -le $CURRENT_MONTH ]; do
    # Format the month with leading zero if needed
    formatted_month=$(printf "%02d" $month)
    
    # Get the start and end date for the month
    start_date="$year-$formatted_month-01"
    end_date=$(date -d "$start_date +1 month -1 day" +%Y-%m-%d)

    # Count commits by the specified users in the given month
    count=$(git log --since="$start_date" --until="$end_date" --author="Michael G. Khmelnitsky\|Lucía M. Polis" --oneline | wc -l)
    
    # Accumulate the total for the current year
    ((year_total += count))
    ((grand_total += count))
    ((year_months += 1))
    ((grand_months += 1))
    
    # Print the result, grouped by year
    if [ $month -eq 1 ] || [ $year -eq $START_YEAR -a $month -eq $START_MONTH ]; then
        if [ $month -ne $START_MONTH ]; then
            if [ $year_months -gt 0 ]; then
                year_avg=$(echo "scale=2; $year_total / $year_months" | bc)
            else
                year_avg=0
            fi
            echo "  Total for $((year - 1)): $year_total"
            echo "  Average per month: $year_avg"
            year_total=0
            year_months=0
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

# Print the total and average for the last year
if [ $year_months -gt 0 ]; then
    year_avg=$(echo "scale=2; $year_total / $year_months" | bc)
else
    year_avg=0
fi
echo "  Total for $((year - 1)): $year_total"
echo "  Average per month: $year_avg"

# Print the grand total and grand average
if [ $grand_months -gt 0 ]; then
    grand_avg=$(echo "scale=2; $grand_total / $grand_months" | bc)
else
    grand_avg=0
fi
echo ""
echo "Grand Total: $grand_total"
echo "Average per month (subtotal): $grand_avg"

