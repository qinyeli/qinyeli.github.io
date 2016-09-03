---
layout: post
title:  "Git Cheat Sheet"
categories: git cheatsheet
published: true
---

# Git Cheat Sheet


## Basics
```bash
git init
git status
git add *
git add .
git commit -m "Init Commit"
git log (--summary)
git remote -v
git remote add origin <url>
git push -u origin master
git pull origin master
git diff HEAD
git diff --staged
git reset <filename>
git checkout -- deleted_file
git rm <filename>
```

## Branches

```bash
git checkout -b new_branch
	// git branch new_branch 
	// git checkout new_branch
git merge another_branch
git branch -d some_branch
git branch -D some_branch
git branch -d --force some_branch
git branch -d -f some_branch
```

## How to recover a deleted file (after commit)?
```bash
git log --diff-filter=D --summary
git checkout <commit>^ <file>
```

## How to recover a deleted file (before commit)?
```bash
git ls-files --deleted
git checkout <file>
```

## How to recover a lost commit?
```bash
git reflog
git reset <commit> --hard
```

## How to undelete changes?
```bash
git fsck (dangling blob)
git cat-file -p <dangling blob> > recovered_file
```

## Other note
```bash
git revert ^ (make a copy of previous commit)
git reset (back to previous commit; to unstage a file)
git reset --hard (to reset a file)
```

