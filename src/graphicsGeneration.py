from hashlib import new
import numpy as np
import cv2

file = open("output.txt", "r")

m = 252 # rows quantity
n = 252 # columns quantity

matrix = np.ones((m,n))

i = 0 # row variable
j = 0 # column variable

for line in file:

    for char in line:

        num = int(char) # string to int

        num *= 255 # color of the letters

        matrix[i][j] = num # sotre current num into matrix

        i += 1

        if i > 251: # new line
            i = 0
            j += 1        


newMatrix = np.array(matrix, dtype=np.uint8)

newMatrix = np.transpose(newMatrix)

cv2.imwrite("Result.png", newMatrix)

file.close

print("")
print("Done")
print("")
