#!octave -qf

# Enter index of the required file
index = input("" , "s");
fileName = ["DataCurve/" index ".txt" ];
fid = fopen(fileName, "r");
in = fscanf(fid, "%f");
fclose(fid);

#Initially writing for cubic curve

X = [ 1, in(1), in(1)**2, in(1)**3 ];
Y = [ in(2) ];
for i = 1:998;
	X = [X; 1, in(2*i+1), in(2*i+1)**2, in(2*i+1)**3 ];
	Y = [Y; in(2*i+2) ];
endfor;

#disp(X)
#disp(Y)

w = inverse(transpose(X)*X)*transpose(X)*Y;
disp(w(1))
disp(w(2))
disp(w(3))
disp(w(4))
