calc: sql.y sql.l
	bison -d sql.y --debug
	flex -o sql.l.c sql.l
	gcc -o sql sql.l.c sql.tab.c -ll -lm 

clean:
	rm -f *.c *.h sql

