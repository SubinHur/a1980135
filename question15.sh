git fetch --all
git switch main
git merge origin/branch1 || true
git add -A
git commit -m "resolve merge conflicts" || true
