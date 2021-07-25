## Task
| Column name | Data type |
|:------------|:-----------|
| title       | string     |
| content     | text       |
| due date    | datetime   |
| progress    | string     |
| priority    | integer    |
| id          | integer    |


## User
| Column name | Data type |
|:----------------|:-----------|
| name            | string     |
| email           | string     |
| password        | string     |
| id              | integer     |


## Label
| Column name | Data type |
|:------------|:-----------|
| name        | string     |


# Heroku step
## git add .
The git add command adds a change in the working directory to the staging area. It tells Git that you want to include updates to a particular file in the next commit.
## git commit -m "comment"
The commit command is used to save changes to a local repository after staging in Git. The git commit command will save all staged changes, along with a brief description from the user, in a “commit” to the local repository. Commits are at the heart of Git usage.
## Git push heroku master
actually pushing your code/app/file (from some local Git repo) to a remote repo 'heroku',  command whenever you want to deploy the latest committed version of your code to Heroku.
## Heroku run db:migrate 
move from the current version to a newer version, Using rake db:migrate you can apply any new changes to your schema. But if you want to rollback to a previous migration you can use rake db:rollback to nullify your new changes if they are incorrectly defined.
