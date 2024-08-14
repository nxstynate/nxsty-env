import ctypes
import random
import time


# Get screen size
user32 = ctypes.windll.user32
screen_width = user32.GetSystemMetrics(0)
screen_height = user32.GetSystemMetrics(1)

# Define necessary functions and structures for mouse movement and key press
class POINT(ctypes.Structure):
    _fields_ = [("x", ctypes.c_long), ("y", ctypes.c_long)]

def move_to(x, y):
    ctypes.windll.user32.SetCursorPos(x, y)

def press_key(hexKeyCode):
    ctypes.windll.user32.keybd_event(hexKeyCode, 0, 0, 0)
    time.sleep(0.05)
    ctypes.windll.user32.keybd_event(hexKeyCode, 0, 2, 0)

def alt_tab():
    ctypes.windll.user32.keybd_event(0x12, 0, 0, 0)  # Alt
    ctypes.windll.user32.keybd_event(0x09, 0, 0, 0)  # Tab
    time.sleep(0.05)
    ctypes.windll.user32.keybd_event(0x09, 0, 2, 0)  # Tab
    ctypes.windll.user32.keybd_event(0x12, 0, 2, 0)  # Alt

def win_tab():
    ctypes.windll.user32.keybd_event(0x5B, 0, 0, 0)  # Win
    ctypes.windll.user32.keybd_event(0x09, 0, 0, 0)  # Tab
    time.sleep(0.05)
    ctypes.windll.user32.keybd_event(0x09, 0, 2, 0)  # Tab
    ctypes.windll.user32.keybd_event(0x5B, 0, 2, 0)  # Win

def win_press():
    ctypes.windll.user32.keybd_event(0x5B, 0, 0, 0)  # Win
    time.sleep(0.05)
    ctypes.windll.user32.keybd_event(0x5B, 0, 2, 0)  # Win

def takeFlight():
    speed = random.uniform(.05, 1)

    try:
        while True:
            x = int(random.uniform(0, screen_width))
            y = int(random.uniform(0, screen_height))

            move_to(x, y)
            time.sleep(speed)

            time.sleep(random.uniform(.5, 20))

            alt_tab()
            time.sleep(random.uniform(.5, 20))

            move_to(x, y)
            time.sleep(speed)

            win_tab()
            time.sleep(random.uniform(2,10))

            win_press()
            time.sleep(random.uniform(.5, 20))

            move_to(x, y)
            time.sleep(speed)

    except Exception as e:
        print(f"Failed to Execute... {e}")

def main():
    takeFlight()

if __name__ == '__main__':
    main()

