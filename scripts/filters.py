#!/usr/bin/python3

import sys
import json
from pandocfilters import toJSONFilter, Image

def custom_image(key, value, format, meta):
    if key == 'Image':
        attrs, alt, [src, title] = value
        # Define your custom LaTeX command here
        custom_latex = f"\\customimage{{{src}}}{{{title}}}"
        return Image(attrs, alt, [src, custom_latex])

if __name__ == "__main__":
    toJSONFilter(custom_image)
