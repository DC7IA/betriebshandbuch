#!/bin/bash

rm -rf /docs/build/
cd docs
make html
make latexpdf
echo "-------------"
echo "done"
