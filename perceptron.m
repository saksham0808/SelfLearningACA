#!octave -qf

index = input("Which file to open? (enter index): " , "s");

fid = fopen(["DataLin/" index ".txt"], "r");
in = fscanf(fid, "%d");
fclose(fid);

X = [1, in(1), in(2)];
Y = [in(3)-4];
for i = 2:19999
	X = [X; 1, in(3*i+1), in(3*i+2)];
	Y = [Y; in(3*i+3)-4];
endfor;

# Least square
w = inverse(transpose(X)*X)*transpose(X)*Y
disp(w)

w_backup = w;

z = sign(X*w);
count = 0;
for i=[2:19999];
	if( z(i)!=Y(i) )
		count = count + 1;
	endif;
endfor;

printf("Initially %d wrongs.\n\n\n", count)

w = [0; 0; 0];

printf("Executing: 00%%\b");
# Perceptron coming up
count = 0;
for j = 1:1000
	for i = 2:19999
		if( sign(X(i,:) * w) != Y(i) )
			for k = 1:1000
				if( sign(X(i,:) * w) != Y(i) )
					w = w + Y(i) * transpose(X(i,:)) ;
				else
					break;
				endif;
			endfor;

			count = count + 1;

		endif;
	endfor;
	#printf("There are %d corrections in loop %d.\n", count, j)

	if(j<100)
		printf("\b%d", j/10);
	else
		printf("\b\b%d", j/10);
	endif;

	count = 0;
endfor;

printf("\n");

disp(w)

z = sign(X*w);
count = 0;
for i = 2:19999
	if( z(i) != Y(i) )
		count = count + 1;
	endif;
endfor;
printf("Finally %d wrongs.\n", count)

x = 0:0.1:740;
plot (x, -w(1)/w(3) - w(2)*x/w(3), x, -w_backup(1)/w_backup(3) - w_backup(2)*x/w_backup(3) )
