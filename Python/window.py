from tkinter import *
master = Tk()

w = Canvas(master, width=250, height=250)

# A
# horizontal
w.create_rectangle(0, 0, 4, 4, fill="red", outline = 'blue')
w.create_rectangle(5, 0, 9, 4, fill="red", outline = 'blue')
w.create_rectangle(10, 0, 14, 4, fill="red", outline = 'blue')
w.create_rectangle(15, 0, 19, 4, fill="red", outline = 'blue')
w.create_rectangle(20, 0, 24, 4, fill="red", outline = 'blue')

w.create_rectangle(0, 10, 4, 14, fill="red", outline = 'blue')
w.create_rectangle(5, 10, 9, 14, fill="red", outline = 'blue')
w.create_rectangle(10, 10, 14, 14, fill="red", outline = 'blue')
w.create_rectangle(15, 10, 19, 14, fill="red", outline = 'blue')
w.create_rectangle(20, 10, 24, 14, fill="red", outline = 'blue')

# vertical
w.create_rectangle(0, 0, 4, 4, fill="red", outline = 'blue')
w.create_rectangle(0, 5, 4, 9, fill="red", outline = 'blue')
w.create_rectangle(0, 10, 4, 14, fill="red", outline = 'blue')
w.create_rectangle(0, 15, 4, 19, fill="red", outline = 'blue')
w.create_rectangle(0, 20, 4, 24, fill="red", outline = 'blue')

w.create_rectangle(20, 0, 24, 4, fill="red", outline = 'blue')
w.create_rectangle(20, 5, 24, 9, fill="red", outline = 'blue')
w.create_rectangle(20, 10, 24, 14, fill="red", outline = 'blue')
w.create_rectangle(20, 15, 24, 19, fill="red", outline = 'blue')
w.create_rectangle(20, 20, 24, 24, fill="red", outline = 'blue')

w.pack()

master.mainloop()