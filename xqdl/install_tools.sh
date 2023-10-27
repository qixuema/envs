#!/bin/bash
# install mambaforge
file_name="Mambaforge-$(uname)-$(uname -m).sh"

if [ -f "$file_name" ]; then
    echo "File exists."
else
    echo "File does not exist."
    proxychains curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
fi

bash Mambaforge-$(uname)-$(uname -m).sh
