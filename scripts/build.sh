#!/usr/bin/env sh

# Root path to resolve issues related to relative path
ROOT_DIR=$(pwd)
# Set the directory containing the markdown files
SOURCE_DIR="chapters"
# Set the build directory
BUILD_DIR="build"
# Set the output filenames
OUTPUT_LATEX="${BUILD_DIR}/output.tex"
OUTPUT_PDF="${BUILD_DIR}/output.pdf"
# Set the pandoc filter (replace 'image_filter.py' with your actual filter)
PANDOC_FILTER="scripts/filters.js"

# Ensure the build directory exists
mkdir -p "$BUILD_DIR"

# Concatenate all markdown files into one
cat "${SOURCE_DIR}"/*.md > "${BUILD_DIR}/combined.md"

# Convert the combined markdown file to LaTeX with the filter
pandoc "${BUILD_DIR}/combined.md" --filter "$PANDOC_FILTER" -s -o "$OUTPUT_LATEX"

# Compile the LaTeX file to PDF using pdflatex (or another LaTeX engine)
pdflatex -output-directory "$BUILD_DIR" "$OUTPUT_LATEX"

# Optional: Clean up intermediate files
# rm "${BUILD_DIR}/combined.md"
# rm "${BUILD_DIR}/output.aux" "${BUILD_DIR}/output.log" "${BUILD_DIR}/output.out"

echo "PDF generated at $OUTPUT_PDF"
