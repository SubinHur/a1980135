git fetch --all
git switch branch2
git merge origin/branch3 || true
git add -A
git commit -m "resolve merge conflicts" || true
git branch -D branch3 2>/dev/null || git branch -d branch3
