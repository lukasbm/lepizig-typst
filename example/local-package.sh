#!/bin/bash
cd $(git rev-parse --show-toplevel)
python install.py
cd example
typst compile --root .. --font-path ../fonts/ local-package.typ local-pacakge.pdf
