from maya import standalone, cmds
import sys

standalone.initialize()

def main(file):
    print(file)
    cmds.file(file, open=1, force=1)

main(sys.argv[1])
