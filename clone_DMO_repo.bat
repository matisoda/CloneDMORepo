@echo off
cls
SET RepoURLSource=<repo address with PAT>

SET RepoURLDestination=<repo address with PAT>
SET tempRepoFolderLocation=C:\TempRepos
SET GitRepoName=DMO.git

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

echo Deleting local temporary folder %tempRepoFolderLocation% 

cd %tempRepoFolderLocation% 
rmdir tempRepoFolder /s /q

pause