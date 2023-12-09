# #!/bin/bash

# # Prompt user for the name of the experience
# read -p "Enter the name of the experience: " experience_name

# # Prompt user for the name of the country
# read -p "Enter the name of the country: " country_name

# # Prompt user for the target page
# read -p "Enter the target page: " target_page

experience_name="testing"
country_name="france"
target_page="https://www.emma-matratze.de/"

# Create a folder based on country and experience name
folder_path="./src/$country_name/$experience_name"
mkdir -p "$folder_path"
echo "Created folder: $folder_path"

# Fetch HTML content of the target page and save it to the folder
html_content=$(curl -s "$target_page")
echo "$html_content" > "$folder_path/target_page.html"
touch "$folder_path/index.js"

# Modify the HTML file to append the script tag before the closing </body> tag
sed -i 's|</body>|<script src="./index.js"></script>\n&|' "$folder_path/target_page.html"

# Print a message using the provided information
echo "You have selected the following:
Experience Name: $experience_name
Country Name: $country_name
Target Page: $target_page

HTML content has been saved to: $folder_path/target_page.html"