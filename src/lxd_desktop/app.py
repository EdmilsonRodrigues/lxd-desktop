"""
File this later
"""

import importlib.metadata
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

from lxd_desktop.controllers.main_controller import MainWindowController

DEBUG = True
MAIN_QML_FILE = 'lxd_desktop/views/main.qml'

def main():
    # Linux desktop environments use an app's .desktop file to integrate the app
    # in to their application menus. The .desktop file of this app will include
    # the StartupWMClass key, set to app's formal name. This helps associate the
    # app's windows to its menu item.
    #
    # For association to work, any windows of the app must have WMCLASS property
    # set to match the value set in app's desktop file. For PySide6, this is set
    # with setApplicationName().

    if not DEBUG:
        # Find the name of the module that was used to start the app
        app_module = sys.modules["__main__"].__package__
        # Retrieve the app's metadata
        metadata = importlib.metadata.metadata(app_module)

        QGuiApplication.setApplicationName(metadata["Formal-Name"])

    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine()
    controller = MainWindowController(engine)

    engine.rootContext().setContextProperty('mainController', controller)

    engine.load(MAIN_QML_FILE)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
