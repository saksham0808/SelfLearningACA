import numpy as np
import cv2

input = input("")
num = int(input)

img = np.zeros((740,740,3), np.uint8)
cv2.namedWindow("My Window")

for i in range(0,num): 
    inten = int(np.random.normal(200,100))
    symmt = int(np.random.normal(300,100))
    print (inten),
    print ("\t\t"),
    print (symmt),
    print ("\t\t"),
    print("3")
    cv2.circle(img,(inten,symmt),3,(255,0,0),-1)

for i in range(0,num):
    inten = int(np.random.normal(400,100))
    symmt = int(np.random.normal(600,100))
    print (inten),
    print ("\t\t"),
    print (symmt),
    print ("\t\t"),
    print("5")
    cv2.circle(img,(inten,symmt),3,(0,255,0),-1)

cv2.imshow("My Window", img)
while(1):
    k = cv2.waitKey(20) & 0xFF
    if k == 27:
        cv2.destroyAllWindows()
        break
