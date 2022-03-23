from hashlib import new
import numpy as np
import cv2

file = open("output.txt", "r")

m = 252
n = 252

matrix = np.ones((m,n))

#print(matrix)

i = 0
j = 0

for line in file:

    for char in line:

        num = int(char)

        num *= 255

        matrix[i][j] = num

        i += 1

        if i > 251:
            i = 0
            j += 1        


newMatrix = np.array(matrix, dtype=np.uint8)

print(newMatrix)

newMatrix = np.transpose(newMatrix)

cv2.imwrite("prueba.png", newMatrix)

file.close