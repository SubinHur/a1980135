git fetch --all
git switch main
mkdir -p dir1/dir2 dir3
:> dir1/dir2/foo
:> dir3/bar
cp dir3/bar dir3/bar_copy
git add -A
git commit -m "setup main"

git switch -c branch1
git mv dir1/dir2/foo dir1/foo
git rm -r dir1/dir2 2>/dev/null || true
rm -f dir3/bar_copy 2>/dev/null || true
:> newfile1
git add -A
git commit -m "setup branch1"

git switch main
git switch -c branch2
git mv dir1/dir2/foo dir1/dir2/foo_modified
git mv dir3 dir1/
:> dir1/dir3/newfile2
git add -A
git commit -m "setup branch2"
