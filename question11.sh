git switch -c branch2
:> file4
git add file4
git commit -m "add file4"
printf x >> file4
git stash push -u -m "wip"
git switch main
