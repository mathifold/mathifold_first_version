#!/bin/bash
set -e

# Build the _site/ contents with Jekyll
jekyll build

#~/source/google/google_appengine/appcfg.py --oauth2 update .
~/wks/source/google/google_appengine/appcfg.py update .

