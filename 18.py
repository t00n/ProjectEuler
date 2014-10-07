#!/usr/bin/python

with open ("p067_triangle.txt", "r") as f:
	pyramide = []
	for line in f:
		pyramide.append([int (i) for i in line[:-1].split(" ")])
	
for i in range(1, len(pyramide)):
	for j in range(len(pyramide[i])):
		if (j == 0):
			pyramide[i][j] += pyramide[i-1][j]
		elif (j == i):
			pyramide[i][i] += pyramide[i-1][j-1]
		else:
			pyramide[i][j] = max(pyramide[i][j] + pyramide[i-1][j], pyramide[i][j] + pyramide[i-1][j-1])


print (max(pyramide[-1]))
		