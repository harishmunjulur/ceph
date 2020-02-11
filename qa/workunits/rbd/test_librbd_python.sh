#!/bin/sh -ex

relpath=$(dirname $0)/../../../src/test/pybind

source /etc/os-release

pycmd=$"nosetests"

if [ "$VERSION_ID" == "8.0" ]; then
        pycmd=$"python3 -m nose"
fi
echo "harish"
echo "$pycmd"

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --errors-for-leak-kinds=definite --error-exitcode=1 \
   $pycmd -v $relpath/test_rbd.py
else
  $pycmd -v $relpath/test_rbd.py
fi
exit 0
