import unittest
from animation_exporter.animation_exporter_interface.controller import export_controller
from maya import cmds
import os
from pymel import core as pm

test_cube_example_scene = os.path.join("data", "test_cube_animation", "test_cube_animation.mb")
test_cube_example_export =os.path.join("data", "test_cube_animation",  "test_cube_animation.fbx")

def tst_scene_01():
    cmds.file(new=True, force=True)

    _cube = "cube"

    cmds.polyCube(name=_cube)

    _childCube = "childcube"

    cmds.polyCube(name=_childCube)

    cmds.parent(_childCube, _cube)

    cmds.file(r'Q:\__packages\_GitHub\testfile.ma', rename=True)

    cmds.file(save=True, force=True)


class TestExportController(unittest.TestCase):

    def test_export_fbx(self):
        tst_scene_01()

        self.assertEqual(True, False)


if __name__ == "__main__":
    unittest.main()
