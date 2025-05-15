#!/bin/bash

echo "Searching for files with unknown owners..."
find / -nouser -print

echo "Searching for files with unknown groups..."
find / -nogroup -print
