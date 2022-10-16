model: model.o
	gcc -o model model.o 
model.o: model.s
	as -g -o model.o model.s

