CC=gcc
OBJS=test.o
TARGET=test
obj-m+=blkdev.o

all : $(OBJS)
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	$(CC) -o $(TARGET) $^

clean :
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -rf $(TARGET) $(OBJS)
