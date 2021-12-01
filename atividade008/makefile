calc: html.y html.l
	bison -d html.y --debug
	flex -o html.l.c html.l
	gcc -o html html.l.c html.tab.c -ll -lm 

clean:
	rm -f *.c *.h html

