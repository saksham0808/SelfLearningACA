import cv2
import sys

coeffs = []
f = open("Cubic.txt", "r")

strer = f.read();
coeffs = strer.split('\n') 

f.close()

x,y = 0,0

while x<3:
    exper = str(coeffs[0]) + " + " + str(coeffs[1]) + "*x" + " + " + str(coeffs[2]) + "*x**2" + " + " + str(coeffs[3]) + "*x**3"
    a = eval(exper)
    print a
    x = x+0.01
