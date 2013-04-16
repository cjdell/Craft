INCLUDE=-I glfw/include -I glew/include -I sqlite3
LIBRARY=-L glfw/lib/win32 -L glew/lib
FLAGS=-std=c99 -O3

all: main

run: all
	./main

clean:
	rm *.o

main: main.o util.o noise.o map.o db.o sqlite3.o
	gcc $(FLAGS) main.o util.o noise.o map.o db.o sqlite3.o -o main $(LIBRARY) -lglfw -lglew32 -lopengl32

main.o: main.c
	gcc $(FLAGS) $(INCLUDE) -c -o main.o main.c

util.o: util.c util.h
	gcc $(FLAGS) $(INCLUDE) -c -o util.o util.c

noise.o: noise.c noise.h
	gcc $(FLAGS) $(INCLUDE) -c -o noise.o noise.c

map.o: map.c map.h
	gcc $(FLAGS) $(INCLUDE) -c -o map.o map.c

db.o: db.c db.h
	gcc $(FLAGS) $(INCLUDE) -c -o db.o db.c

sqlite3.o:
	gcc $(FLAGS) -c -o sqlite3.o sqlite3/sqlite3.c
