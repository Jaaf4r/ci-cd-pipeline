#!/bin/bash

if diff <(./pp) <(echo -n "alo test\n") > /dev/null; then
    echo "✅ Match!"
	exit 0
else
    echo "❌ No Match!"
	exit 1
fi
