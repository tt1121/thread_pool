# 最后的可执行文件
PROGRAM := thread_pool
LDFLAGS := -lpthread
CFLAGS  := -O -W
INCLUDE :=
CC		:= gcc
#通配当前目录下说有的.c文件
SOURCES := $(wildcard *.c)   
#把$(SOURCES)中的变量符合后缀是.c的全部替换成.o，
OBJS    := $(patsubst %.c,%.o,$(SOURCES))  

.PHONY: clean 

$(PROGRAM): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)
%.o: %.c
	$(CC) -c $^ $(CFLAGS) $(INCLUDE)    

clean:
	rm *.o $(PROGRAM) -f

# $@:当前规则的目的文件名， $<:依靠列表中的第 一个依靠文件，而 $^:整个依靠的列表（除掉了里面所有重复的文件名）。