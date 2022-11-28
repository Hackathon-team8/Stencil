import sys

NB_ITER = sys.argv[1]

base = open('result_base.dat','r')
compil = open('result_accelerated.dat','r')

precision = [[0] * 11] * NB_ITER
speed_base = 0
speed_compil = 0


for i in range(NB_ITER):
	line_base = base.readline()
	line_compil = compil.readline()

	base_split = line_base.split()
	compil_split = line_compil.split()

	for j in range(1,6):
		precision[i][j] = abs(float(base_split[j])-float(compil_split[j]))/abs(float(compil_split[j]))


	speed_base = speed_base + int(base_split[6])
	speed_compil = speed_compil + int(compil_split[6])

print("Precision: ")
for i in range(NB_ITER):
	print(precision[i])

print("Acceleration: ")
print(speed_base/speed_compil)
