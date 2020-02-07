#!/bin/sh -ex

relpath=$(dirname $0)/../../../src/test/pybind

python2 --version

pip2 --version

sudo pip2 install nose

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --errors-for-leak-kinds=definite --error-exitcode=1 \
    nosetests -v $relpath/test_rbd.py
else
  nosetests -v $relpath/test_rbd.py
fi
exit 0
