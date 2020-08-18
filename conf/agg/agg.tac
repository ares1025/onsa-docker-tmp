# Generic OpenNSA tac file
#
# this expects the 'opennsa' module to be in python-path and CONFIG_FILE to be set

import os
from opennsa import setup

remote_debug = os.getenv('REMOTE_DEBUG',0)
if remote_debug == "1":
    import ptvsd
    ptvsd.enable_attach(address=('10.250.0.21', 3343), redirect_output=True)
    ptvsd.wait_for_attach()

configfile = "/conf/opennsa-agg.conf"

application = setup.createApplication(configfile, payload=False, debug=True)
