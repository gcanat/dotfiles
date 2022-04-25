#!/usr/bin/env python3

import json
import urllib.request

with urllib.request.urlopen("https://ipv4.geojs.io/v1/ip/geo.json") as url:
    data = json.loads(url.read().decode())
    name = None
    if 'city' in data.keys():
        name = data['city']
    elif 'organization_name' in data.keys():
        name = data['organization_name']
    else:
        name = 'N/A'
    str = " " + data['ip'] + " (" + name + ", " + data['country_code'] + ")"
    print(str, end='')
