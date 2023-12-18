#!/bin/bash
# Replace OLD_NAME and OLD_EMAIL with the incorrect author information
# Replace NEW_NAME and NEW_EMAIL with the correct author information
# git filter-branch --env-filter '
OLD_NAME="Zohaib Khan"
OLD_EMAIL="zohaib@bsf19a064iasedu.onmicrosoft.com"
NEW_NAME="mrzohaibkhan"
NEW_EMAIL="zohaibyousafzai15@gmail.com"

# Run git filter-branch with force overwrite
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --env-filter "

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" -o "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" -o "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]; then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
" --tag-name-filter cat -- --branches --tags

# If you've already pushed the commits, force push to update the remote repository
git push --force
