# Contributing

LXD Desktop is still a initial project, and we welcome all contributions. This project
is and will always be free, and is meant to help introducing users who are still not 
confortable with using the LXD CLI interface, to have a friendly interface for it.

## Open source license

LXD Desktop is licensed under [GPL-3.0](LICENSE).

## Report an issue or open a request

If you find a bug or feature gap in LXD Desktop, look for it in the [project's GitHub
issues](https://github.com/EdmilsonRodrigues/lxd-desktop/issues) first. If you have 
fresh input, add your voice to the issue.

If the bug or feature doesn't have an issue, we invite you to [open
one](https://github.com/EdmilsonRodrigues/lxd-desktop/issues/new/choose).

## Set up for development

LXD Desktop uses a forking, feature-based workflow. Most work on LXD Desktop occurs on
people's local systems, and can depend on graphical interfaces. Remote testing and building
is provided on GitHub for continuous integration and delivery.

Start by [creating a personal fork](https://github.com/EdmilsonRodrigues/lxd-desktop/fork) of
the repository on GitHub.

Next, on your host system, clone your fork:

```bash
git clone git@github.com:<username>/lxd-desktop.git
```

Inside the project directory, set up the virtual development environment and install all
dependencies, linters, and testers:

```bash
make setup
make full-lint
make test
```

If all linting and testing completes without errors, your local environment is ready.

### Install LXD
Though it is not necessary for all kinds of changes, like documentation, or changes on the
`qml` files (the frontend of the project), if working on the Python code, will be probably
necessary to install the `lxd` in order to properly test the project.

If you want to learn more about LXD, check the [official documentation of the original soft-
ware](https://documentation.ubuntu.com/lxd/latest/getting_started/). If you want, go check the [source code](https://github.com/canonical/lxd), and finally, if you want to dive deeper 
on the [python api for lxd](https://github.com/canonical/pylxd)

The easiest way to download LXD is via snap:
```bash
snap install lxd
```

## Contribute a change

With the prerequisites out of the way, let's walk through how to make a contribution to
LXD Desktop.

### Research the topic

All work in LXD Desktop should be tied to an existing issue.

If you want to join the development team, and to keep track of the development of our 
Roadmap, just [send me an email](mailto:edmilson.rodriguesn38@gmail.com).

If you'd like to add a small feature or fix, check the project's GitHub issues to see if
others have reported it. If they have, look into the current status of the topic. If no
one else is working on it, add a comment stating that you'd like to take it on, and we we'll
assign it to you.

If you're ever in doubt about developments in the project, ask!

### Create a development branch

Once you've settled on a topic to work on, it's time to set up a local branch.

Always start by syncing against the master branch.

If you're contributing to multiple releases or the next major release, run:

```bash
git checkout master
git fetch
git pull
make setup
```

Next, create a new branch against your base. For now, just make sure the name
of the branch is significant.

```bash
git checkout -b issue-12-add-create-button-to-instance-screen
```

Or, if using `git switch`:

```bash
git switch -C feat/add-lxd-service
```

### Commit a change

Once you've made the changes to the code and you're ready to test it, start by
committing:

```bash
git add .
git commit -m "(type):(short description)" [optional]: -m "bigger description"
```

Format the commit message according to the [Conventional
Commits](https://www.conventionalcommits.org/en/v1.0.0/) style. For the adding a 
button for creating a network for example, an appropriate commit title would be:

```
feat: add button to create network
```

> With complex changes, you might get stuck choosing a conventional commit type.
>
> This may signal that a commit is doing more than one thing and should be broken into
> multiple smaller commits. A commit should not, for example, refactor code and fix a
> bug. That should be two separate commits.
>
> In other scenarios, multiple types could be appropriate because of the nature of the
> commit. This can happen with test and docs, which can be used as either types or
> scopes.
>
> Run down the following list and select the highest-ranked type that fits your change:
>
> - ci
> - build
> - feat
> - fix
> - perf
> - refactor
> - style
> - test
> - docs
> - chore

Committing triggers the pre-commit hook (will do), which runs the automatic code 
formatter and the fast linters.

If the linters reformatted any of the files, the commit was cancelled. To make the
changes stick, restage the modified files with `git add -A` and commit again.

### Test the change

Test early and often, especially before you plan to open a pull request.

For low-complexity changes that require basic unit testing, run the fast tests:

```bash
make test-unit
```

For complex work, run the full test suite:

```bash
make test
```

### Document the change

LXD Desktop will have auto generated documentation. If you want to contribute for it, 
go for it!!

### Push the branch and open a PR

Once your work is committed to your branch, push it to your fork:

```bash
git push -u origin <branch-name>
```

Finally, [open a PR](https://github.com/EdmilsonRodrigues/lxd-desktop/compare) for it on GitHub.
If your branch has one commit, GitHub will title the PR after it. If your branch has
more than one commit, name the PR after the most significant. 

### Follow up for the review

When a maintainer reviews your PR, they typically leave inline comments and suggestions
on the code.

If the comment is a request, accommodate it by pushing one or more additional commits to
the branch. It's simplest to add the commits locally and push, rather than in the GitHub
interface, as it leads to fewer potential conflicts with syncs.

Don't force-push changes to the branch. It destroys the history of the review and makes
it harder for maintainers to see code changes.
