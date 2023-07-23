import vim
import threading

from win32con import WM_INPUTLANGCHANGEREQUEST
import win32gui
import win32api


class ImSelectUtil():
    def __init__(self):
        self.hwnd = win32gui.GetForegroundWindow()
        self.insert_engines = vim.vars.get('imselect_insert_engines')
        self.normal_engines = vim.vars.get('imselect_normal_engines')

    @staticmethod
    def set_engine(hwnd, engine):
        win32api.SendMessage(hwnd, WM_INPUTLANGCHANGEREQUEST, 0, engine)

    def insert(self):
        self.now_engine = self.insert_engines[vim.vars.get('imselect_insert_engines_idx')]
        t = threading.Thread(target = ImSelectUtil.set_engine, args=(self.hwnd, self.now_engine))
        t.start()

    def normal(self):
        self.now_engine = self.normal_engines[vim.vars.get('imselect_normal_engines_idx')]
        t = threading.Thread(target = ImSelectUtil.set_engine, args=(self.hwnd, self.now_engine))
        t.start()

imselectUtil = ImSelectUtil()
