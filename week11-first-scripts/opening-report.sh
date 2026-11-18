#!/bin/bash
# opening-report.sh - Driftwood Books morning report
# Usage: ./opening-report.sh [sales-file]
# Author: Kelsey

sales_file="${1:-sales.csv}"
read -r -p "Who is opening the shop? " opener
sales=$(awk -F, 'NR>1' "$sales_file" | wc -l)
books=$(awk -F, 'NR>1 {b+=$3} END {print b}' "$sales_file")
revenue=$(awk -F, 'NR>1 {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")
online=$(awk -F, 'NR>1 && $5=="online" {t+=$3*$4} END {printf "%.2f", t}' "$sales_file")

echo "=== Driftwood Books: Morning Report ==="
echo "Good morning, $opener. Today is $(date +%A)."
echo "Reading: $sales_file"
echo "Sales: $sales"
echo "Books: $books"
echo "Revenue: \$${revenue}"
echo "Online revenue: \$${online}"
