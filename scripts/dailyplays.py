#!/usr/bin/env python

import json
import sys

with open(sys.argv[1], 'r') as handle:
    with open('dailyplays.ldj', 'w') as output:
        for line in handle:
            doc = json.loads(line)
            if doc['date'] == sys.argv[2]:
                output.write(line + '\n')
