#git-notes

## Initializing a git repository
To create the .git structure in the current folder and enable it as a git repository
```bash
git init
```

To clone a remote repository:
```bash
git clone REPO-URL [FOLDER-NAME]
```
You can optionally specify the folder name that you want to creat for the repository. Otherwise, it will create a folder based on the repository name.


## Adding new files
```bash
git add FILES
```
where FILES can conain wildcards * or ?

## Ignoring files
To ignore certain files from being tracked, inlcude them in the `.gitignore` file.

## Commiting your changes:
```bash
git commit [-m "message"]
```
## Set your git commit username and email
```bash
git config [--global] user.email myemail@example.com
git config [--global] user.name myname
```
When using `--global` it applies to all repositories. To apply to a single repository run the commands in the root folder of your repository where ".git" folder resides.
To verify:
```bash
git config [--global] user.email
git config [--global] user.name
```
