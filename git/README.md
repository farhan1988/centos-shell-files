## Ready made shell scripts for Git Commands

1. prepare-tag.sh
    * This script takes two parameters 
        * **version** to tag and short hand is '-v'.
        * **re-deploy** (OPTIONAL : Default is false) if there is a tag existing already and needs to update latest commits to that particular tag. this will delete the existing tag and re-creates the tag and short hand is '-r'.
     * Usage is as follows
     
        `prepare-tag.sh -v v0.1 # Creates v0.1 tag`
        
        `prepare-tag.sh -v v0.1 -r true # Re-creates v0.1 tag`
