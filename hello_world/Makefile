CXX = aarch64-linux-gnu-g++
CFLAGS = -Wall -std=c++17 #$(SIZEOPT)
OBJ_EXT=.o
CPP_EXT=.cpp

TARGET = hello_world

all: $(TARGET)

SRC_DIR = ./
OBJ_DIR = $(SRC_DIR)objs


$(OBJ_DIR):
	mkdir -p $@

$(OBJS): $(OBJ_DIR)/%$(OBJ_EXT): $(SRC_DIR)/%$(CPP_EXT) | $(OBJ_DIR)
	$(CXX)  $< -c -o $@  $(CFLAGS)

$(TARGET): $(SRCDIR)hello_world$(CPP_EXT) $(OBJS)
	$(CXX) $< -o $@ $(OBJS) $(CFLAGS)

clean:
	rm $(TARGET) $(OBJS)

