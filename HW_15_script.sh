#!/bin/bash
# firstly, specify shell in the first line (so-called shebang)


# assign the value of $@ (all command line arguments) to the variable Q
Q="$@"

# assign a string with some URL to the variable URL where q=sample search is a search value, hl=en stands for English
# language, complete=0 disables autocompletion, tbo=1 is to display search toolbar, num=50 is a number of results in a
# page, tbs=li:1 is to display only results that match the search term verbatim
URL='https://www.google.de/search?q=sample search&hl=en&complete=0&tbo=1&num=50&tbs=li:1'

# assign user's agent to the variable AGENT
AGENT="Mozilla/4.0"

# assign a set of commands to the variable stream. Firstly, the curl command will execute a request to the URL using
# AGENT, replacing spaces in the url address with + character. Next, the output will be passed to the grep command to
# find substrings "/url?q=" and "&amp", and finally grep command's output will be passed to the sed command for removing
# substrings found by grep (notice escaping some characters, e.g. space)
stream=$(curl -A "$AGENT" -skLm 10 "${Q}${URL//\ /+}" | grep -oP '\/url\?q=.+?&amp' | sed 's|/url?q=||; s|&amp||')

# finally, the value of the stream variable will be printed to the stdout with % characters being replaced
echo -e "${stream//\%/\x}"
