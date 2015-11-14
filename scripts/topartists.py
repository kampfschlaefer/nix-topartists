#!/usr/bin/env python

import sys
import collections
import json

counter = collections.Counter()

with open(sys.argv[1], 'r') as handle:
    for line in handle:
        if line.strip() == "":
            continue
        doc = json.loads(line)
        counter[doc['artist']] += 1

with open('topartists.ldj', 'w') as output:
    for name, plays in counter.most_common():
        output.write('%s\t%s\n' % (name, plays))
