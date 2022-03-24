from hashlib import new
import numpy as np
import cv2

file = open("output.txt", "r")

m = 253 # rows quantity
n = 253 # columns quantity

matrix = np.ones((m,n)) # matrix creation

matrix *= 255 # paint all matrix elements with white

i = 1 # row variable
j = 1 # column variable

for line in file:

    for char in line:

        num = int(char) # string to int

        num *= 255 # color of the background

        matrix[i][j] = num # sotre current num into matrix

        i += 1

        if i > 252: # new line
            i = 1
            j += 1        


newMatrix = np.array(matrix, dtype=np.uint8)

newMatrix = np.transpose(newMatrix)

cv2.imwrite("Result.png", newMatrix)

file.close

print("")
print("Done")
print("")

