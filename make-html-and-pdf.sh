#!/bin/bash

rm -rf /docs/build/doctrees
cd docs
make html
make latexpdf
echo "-------------"
echo "done"
