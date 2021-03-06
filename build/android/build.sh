#!/bin/bash

# Usage: the first argument selects the build type:
# - release, to build release only
# - debug, to build debug only
# - continuous, to build release and debug
# - presubmit, for presubmit builds
#
# The default is release

set -e
set -x

UNAME=`echo $(uname)`
LC_UNAME=`echo $UNAME | tr '[:upper:]' '[:lower:]'`

# build-common.sh will generate the following variables:
#     $GENERATE_ARCHIVES
#     $BUILD_DEBUG
#     $BUILD_RELEASE
if [  "$LC_UNAME" == "linux" ]; then
    source `dirname $0`/../linux/ci-common.sh
fi
source `dirname $0`/../linux/build-common.sh

pushd `dirname $0`/../.. > /dev/null
./build.sh -p android -c $GENERATE_ARCHIVES $BUILD_DEBUG $BUILD_RELEASE
