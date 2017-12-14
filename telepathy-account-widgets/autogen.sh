#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="telepathy-account-widgets"
REQUIRED_AUTOMAKE_VERSION=1.9

(test -f $srcdir/configure.ac) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level gnome directory"
    exit 1
}

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME GIT"
    exit 1
}

for arg in $*; do
    case $arg in
        --no-configure)
            export NOCONFIGURE=1
            ;;
        *)
            ;;
    esac
done

USE_GNOME2_MACROS=1 USE_COMMON_DOC_BUILD=yes . gnome-autogen.sh
