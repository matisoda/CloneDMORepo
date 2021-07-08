@echo off
cls
SET RepoURLSource=<repo address with PAT>

SET RepoURLDestination=<repo address with PAT>
SET tempRepoFolderLocation=C:\DMORepositoryClone
SET GitRepoName=DMO.git
SET param1=%1

mkdir %tempRepoFolderLocation% 
cd %tempRepoFolderLocation%

echo Creating local temporary folder in %tempRepoFolderLocation% 

mkdir tempRepoFolder 
cd tempRepoFolder 

git clone --bare %RepoURLSource%

echo Solution support DMO repo cloned

cd %GitRepoName%
git push --mirror %RepoURLDestination%

echo finished copying %RepoURLSource% to %RepoURLDestination%

echo Deleting local temporary folder tempRepoFolder on %tempRepoFolderLocation% 

cd %tempRepoFolderLocation% 
rmdir tempRepoFolder /s /q


set pauseMe=1
if "%param1%"=="SkipPause" set pauseMe=0

if %pauseMe%==1 pause


