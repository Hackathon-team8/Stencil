import numpy as np

expected = open('result_expected.dat','r')
base = open('result_stencil.dat','r')
compil = open('result_compil.dat','r')

precision = [[0] * 11] * 5
speed_base = 0
speed_compil = 0


for i in range(5):
	line_ex = expected.readline()
	line_base = base.readline()
	line_compil = compil.readline()

	ex_split = line_ex.split()
	base_split = line_base.split()
	compil_split = line_compil.split()

	for j in range(1,6):
		precision[i][j] = abs(float(ex_split[j])-float(compil_split[j]))/abs(float(compil_split[j]))


	speed_base = speed_base + int(base_split[6])
	speed_compil = speed_compil + int(compil_split[6])

print("Precision: ")
for i in range(5):
	print(precision[i])

print("Acceleration: ")
print(speed_base/speed_compil)