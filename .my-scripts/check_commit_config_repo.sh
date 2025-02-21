#!/bin/bash
cd $HOME/configs/wsl-debian

if ! git diff-index --quiet HEAD --;
then
    # python3 $HOME/.my-scripts/git_status_table.py "Git status config repo" 2 $(git status -s)
    git add .
    git commit -m "Auto-commit: $(date)"
    git push
fi