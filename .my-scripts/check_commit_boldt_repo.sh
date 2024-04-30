#!/bin/bash
cd $HOME/BOLDT/rgg-lenovo

if ! git diff-index --quiet HEAD --;
then
    python3 $HOME/.my-scripts/git_status_table.py "Git status BOLDT Docs repo" 2 $(git status -s)
fi