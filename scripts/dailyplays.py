#!/usr/bin/env python

import json
import sys

with open('../lpug-luigi/plays.ldj', 'r') as handle:
    with open('dailyplays.ldj', 'w') as output:
        for line in handle:
            doc = json.loads(line)
            if doc['date'] == sys.argv[1]:
                output.write(line + '\n')

