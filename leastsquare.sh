#!octave -qf

index = input("Which file to open? (enter index): " , "s");

fid = fopen(["LinData/" index ".txt"], "r");
in = fscanf(fid, "%d");
fclose(fid);

X = [1, in(1), in(2)];
Y = [in(3)-4];
for i = 2:19999;
	X = [X; 1, in(3*i+1), in(3*i+2)];
	Y = [Y; in(3*i+3)-4];
endfor;

w = inverse(transpose(X)*X)*transpose(X)*Y

z = sign(X*w);

count = 0;
for i=[2:19999];
	if( z(i)!=Y(i) )
		count = count + 1;
	endif;
endfor;

printf("There are %d wrongs.\n", count)
