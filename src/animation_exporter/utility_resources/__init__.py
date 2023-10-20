import logging
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)


import os, sys
_parentDir = os.path.dirname(__file__)
if _parentDir not in sys.path:
    sys.path.append(_parentDir)

import settings
