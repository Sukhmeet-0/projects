import tkinter as tk
from tkinter import filedialog
from compressmodule import compress,decompress
def open_file():
    filename=filedialog.askopenfilename(initialdir='/',title="Select a file to compress")
    return filename
def compression(i,o):
    compress(i,o)
def decompresssion(i,o):
    decompress(i,o);


window=tk.Tk()
window.title("Compression engine")
window.geometry("600x400")

# input_entry=tk.Entry(window)
# output_entry=tk.Entry(window)

# inplabel=tk.Label(window,text="File to be compressed: ")
# outlabel=tk.Label(window,text="Name of the compressed file: ")
compress_button=tk.Button(window,text="Compress",command=lambda: compression(open_file(),"compressedoutputfile.txt"))

# inplabel.grid(row=0,column=0)
# input_entry.grid(row=0,column=1)
# outlabel.grid(row=1,column=0)
# output_entry.grid(row=1,column=1)
compress_button.grid(row=2,column=1)




window.mainloop()