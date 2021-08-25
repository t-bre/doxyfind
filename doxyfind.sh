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
    exit $?
fi

echo "Repo root folder: " $REPOROOT

# use find to locate doxyfiles in the repo
DOXYFILES=$(find $REPOROOT -name Doxyfile)

if [ -z $DOXYFILES ]; then
    echo "No doxyfiles in repo"
    exit $?
fi

# assume first path is the shortest
read TMP __ <<< $DOXYFILES
SHORTEST=$(dirname $TMP)

# loop through filenames
for FILE in $DOXYFILES
do
    # strip doxyfile from name to get path
    DIR=$(dirname $FILE)
    
    # check if this path is shorter than the current shortest
    if [ ${#DIR} -lt ${#SHORTEST} ]
    then
        SHORTEST=$DIR
    fi
done

# now we have the shortest path to a doxyfile in this repo
echo "Shortest path to doxyfile: " $SHORTEST

# go to directory and run doxygen
cd $SHORTEST
doxygen
