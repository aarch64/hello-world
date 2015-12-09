hello: hello.o
	ld -o $@ $<

hello.o: hello.s
	as -o $@ $<

.PHONY: clean
clean:
	rm -f hello.o
