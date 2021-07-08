@echo off
cls
SET RepoDir=DMO
SET RepoURLSource=<repo address with PAT>
SET RepoURLDestination=<repo address with PAT>

IF EXIST %RepoDir% (
	ECHO DMO local repository already exists, updating it now...
	cd %RepoDir%
	git -c diff.mnemonicprefix=false -c core.quotepath=false --no-optional-locks fetch --prune --tags --all
	git -c diff.mnemonicprefix=false -c core.quotepath=false --no-optional-locks pull --all
) ELSE (
	ECHO DMO local repository doesn't exist, cloning it now...
	git clone --branch master/1.15 %RepoURLSource%
	cd %RepoDir%
)

ECHO Pushing DMO Repository changes remotely...
git push --mirror --force %RepoURLDestination%

cd ..
ECHO Done