#!/bin/bash

# Check if the required argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 input.csv"
    exit 1
fi

input_csv="$1"
output_vcf="${input_csv%.csv}.vcf"

# Check if the input CSV file exists
if [ ! -f "$input_csv" ]; then
    echo "Input CSV file not found: $input_csv"
    exit 1
fi

# Function to convert CSV to VCF format
csv_to_vcf() {
    local name="$1"
    local phone="$2"
    local email="$3"
    echo "BEGIN:VCARD"
    echo "VERSION:3.0"
    echo "FN:$name"
    echo "TEL;TYPE=CELL:$phone"
    echo "EMAIL;TYPE=INTERNET:$email"
    echo "END:VCARD"
}

# Create the VCF file
echo -e "BEGIN:VCARD\nVERSION:3.0" > "$output_vcf"

# Loop through the CSV file and convert each line to VCF
while IFS=, read -r name phone email; do
    csv_to_vcf "$name" "$phone" "$email" >> "$output_vcf"
done < "$input_csv"

# Add closing VCF tag
echo "END:VCARD" >> "$output_vcf"

echo "Conversion complete. VCF file saved as $output_vcf"

