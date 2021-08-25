#################################################################
#
# @file     doxyfind.sh
# @author   Tim Brewis (t-bre)
# @date     2021-08-25
#
# @details  Shell script to find and run the Doxyfile with the
#           shortest path relative to the root of the git repo
#           which the current working directory is in.
#
#################################################################

# find the root of the current git repo
REPOROOT=$(git rev-parse --show-toplevel)

if [ $? -ne 0 ]; then
    exit $? # not a git repo
fi

echo "Repo root folder: " $REPOROOT

# locate doxyfiles in repo
DOXYFILES=$(find $REPOROOT -name Doxyfile)

if [ -z $DOXYFILES ]; then
    echo "No doxyfiles in repo"
    exit $?
fi

# assume first path to a doxyfile is the shortest
# strip "Doxyfile" from path to get containing directory
read TMP __ <<< $DOXYFILES
SHORTEST=$(dirname $TMP)

# loop through paths to doxyfiles
for FILE in $DOXYFILES
do
    # strip "Doxyfile" from path to get containing directory
    DIR=$(dirname $FILE)
    
    # check if directory path is shorter than the current shortest
    if [ ${#DIR} -lt ${#SHORTEST} ]
    then
        SHORTEST=$DIR
    fi
done

# now we have the shortest path to a directory containing a doxyfile in this repo
echo "Shortest path to doxyfile: " $SHORTEST

# go to directory and run doxygen
cd $SHORTEST
doxygen
