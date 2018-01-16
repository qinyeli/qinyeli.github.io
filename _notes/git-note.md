---
layout: post
title:  "Git Note"
categories: git note
published: true
---



## How to migrate a git repo

```bash
$ git clone --mirror https://old.repo.url
$ git push --mirror https://new.repo.url
```

## To uncommit the last commit but leaving the changes
```bash
$ git reset --soft HEAD^
```