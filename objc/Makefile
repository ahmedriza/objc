OBJ = main.o Person.o Employee.o Asset.o
CC = clang
# CFLAGS = -I /GNUstep/GNUstep/System/Library/Headers -std=c99 -fconstant-string-class=NSConstantString
# LDFLAGS = -L /GNUstep/GNUstep/System/Library/Libraries -lobjc -lgnustep-base
OS = $(shell uname -s)
ifeq ($(OS), Darwin)
	LDFLAGS = -lobjc
else
	LDFLAGS = -L /GNUstep/GNUstep/System/Library/Libraries -lobjc -lgnustep-base
endif

# gcc -o helloworld helloworld.m -I /GNUstep/GNUstep/System/Library/Headers -L /GNUstep/GNUstep/System/Library/Libraries -std=c99 -lobjc -lgnustep-base -fconstant-string-class=NSConstantString
#
# clang -fobjc-nonfragile-abi -fobjc-arc
#
CFLAGS = -I /GNUstep/GNUstep/System/Library/Headers -fobjc-nonfragile-abi -fobjc-arc

main: $(OBJ)
	$(CC) -o main $(OBJ) $(CFLAGS) $(LDFLAGS)

%.o: %.m
	$(CC) $(CFLAGS) -c $<

clean:
	-rm *.o *.exe
