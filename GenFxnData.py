import numpy as np
import cv2
import math
import sys

toSaveData = 0
fileName = "1"
if len(sys.argv) == 2:
    toSaveData = 1
    fileName = str(sys.argv[1])
    print ("File saving is on.")

else
    print ("File saving is off")

elif len(sys.argv) > 2:
    print ("Error in arguements provided. Please check.")

input = input("")
num = int(input)

img = np.zeros((500,500,3), np.uint8)
cv2.namedWindow("My Window")
toPrint = ""

for i in range(0,num): 
    xPoint = np.random.normal( i/num * 3)
    yPoint = np.random.normal( math.sin(xPoint) , 0.2)
    print (xPoint),
    print ("\t\t"),
    print (yPoint)
    if toSaveData:
        toPrint += str(xPoint) + "\t\t" + str(yPoint) + "\n"

    cv2.circle(img,(int(100*xPoint+250),int(100*yPoint+250)),3,(255,0,0),-1)

cv2.imshow("My Window", img)

# Writing image
if toSaveData == 1:
    cv2.imwrite("FxnData/" + fileName + ".jpg", img)
    f = open("FxnData/" + fileName + ".txt", "w")
    f.write(toPrint)
    f.close()

while(1):
    k = cv2.waitKey(20) & 0xFF
    if k == 27:
        cv2.destroyAllWindows()
        break
