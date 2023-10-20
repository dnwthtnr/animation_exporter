import os, sys


# TODO: Figure out best way to make it so dependent modules can reference same package -- i.e. animexporter and wrappers both need math_operations.
# TODO: Cleanup

def addParentDirectoryToPath(currentDirectory):
    _parentDir = os.path.dirname(__file__)
    if _parentDir not in sys.path:
        sys.path.append(_parentDir)

