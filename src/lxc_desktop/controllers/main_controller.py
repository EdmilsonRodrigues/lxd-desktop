from PySide6.QtCore import QObject


class MainWindowController(QObject):
    def __init__(self, engine):
        super().__init__()
        self.engine = engine
        self._modal_windows = {}
