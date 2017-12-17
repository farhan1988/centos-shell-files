#!/bin/sh
## Fist parameter is Version $1
## Second parameter is re_redeploy $2

help_content="Should pass parametes '-v | --version' and '-r | --redeploy (boolean)'"
redeploy=false

if [[ $# -eq 0 ]] ; then
    echo "$help_content";
    exit 1
fi

while getopts v:r: opts; do
   case ${opts} in
   	  h) echo "$help_content";;
      v) version=${OPTARG} ;;
      r) redeploy=${OPTARG} ;;
   esac
done
echo ">>>>> Preparing $version tag for Cloud Portal Automation API <<<<<"
if $redeploy; then
	echo ">>>>>> Removing existing tag on $version from Local"
	git tag -d "$version" 
	echo ">>>>>> Removing existing tag on $version on Remote"
	git push origin :refs/tags/"$version" 
fi

git tag "$version" 
git push --tag
echo ">>>>>> $version tag created successfully <<<<<"
