# A Blackout Against Fascism

In response to the continued failure of the Ruby community to cast out DHH for
advocating for genocide I am blacking out my open source repos. We have to set
a line somewhere or we will all perish to the tide of inhumanity and barbarity
of the rising fascism in the world.

## How to take part

1) Clone this repo:

`gh repo clone kwstannard/blackout-against-fascism`

2) Go into the repo:

`cd blackout-against-fascism`

3) Push to your OSS project:

`git push -f {repo_url}`

4) delete any feature branches:

```
cd {my_repo}
git branch -r \
    | grep origin/ \
    | grep -v HEAD \
    | cut -d/ -f2 \
    | while read line; do git push origin :$line; done;
```
