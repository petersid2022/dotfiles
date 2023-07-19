#!/bin/sh

# I used to include all of the License info in the README.md file 
# but I found that it was too much clutter
# so I decided to create a separate LICENSE file

# This script adds a license file to a git repository
# and updates the README.md file with the license information
# and pushes the changes to the remote repository

# Peter Sideris 2023

# TODO: add more license options and a command line option to choose the license type

LICENSE_MIT="(The MIT License)
Copyright (c) 2023 Peter Sideris petersid2022@gmail.com
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."

README_LICENSE="This project is licensed under the MIT License. Please see the [LICENSE](./LICENSE) file for more details."

# check if the user inputted a path
if [ -z "$1" ]; then
    echo "Please enter a path to a folder"
    exit 1
fi

# check if the path exists
if [ ! -d "$1" ]; then
    echo "The path you entered does not exist"
    exit 1
fi

# check if the path is a git repository
if [ ! -d "$1/.git" ]; then
    echo "The path you entered is not a git repository"
    exit 1
fi

# check if the path contains a readme file
if [ ! -f "$1/README.md" ]; then
    echo "The path you entered does not contain a README.md file"
    exit 1
fi

# check if the path contains a license file
if [ -f "$1/LICENSE" ]; then
    echo "The path you entered already contains a LICENSE file"
    exit 1
fi

# Remove all lines after "## License" line (excluding the line itself) in the README.md file
sed -i '/## License/,$ { /^## License$/!d; }' "$1/README.md"

# Append the README_LICENSE content to the README.md file
printf "%s\n" "$README_LICENSE" >> "$1/README.md"

# Create the license file
echo "$LICENSE_MIT" > "$1/LICENSE"

# Add the license file to the git staging area
# and commit it with the message "added license file"
# and push the changes to the remote repository
# and print the git status
cd "$1" || exit
git add LICENSE
git commit -m "added license file"
git add README.md
git commit -m "updated readme file"
git push

# Exit the script
exit 0

