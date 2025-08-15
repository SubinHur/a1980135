git fetch --all
git switch main
for b in $(git branch -r | sed 's|origin/||' | grep '^ready'); do
  git switch -c "$b" --track "origin/$b"
  git switch main
  git merge --no-ff -m "merge $b" "$b" || true
done
git add -A
git commit -m "resolve conflicts from ready branches" || true
for b in $(git branch --list 'ready*'); do git branch -D "$b"; done
for b in $(git branch -r | sed 's|origin/||' | grep '^update'); do
  git switch -c "$b" --track "origin/$b"
  git merge --no-ff -m "update from main" main || true
  git push origin "$b"
done
git switch main
