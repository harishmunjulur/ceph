#!/bin/sh -ex

relpath=$(dirname $0)/../../../src/test/pybind

source $(dirname $0)/../ceph-helpers-root.sh
install python2-nose

ls /usr/bin

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --errors-for-leak-kinds=definite --error-exitcode=1 \
   nosetests-3 -v $relpath/test_rbd.py
else
  nosetests-3 -v $relpath/test_rbd.py
fi
exit 0
