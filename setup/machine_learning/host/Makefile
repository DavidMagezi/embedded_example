#add input - as directory
#write example hello world
#g++ -std=c++11 -O3 -I.. ../dlib/all/source.cpp -lpthread -lX11 example_program_name.cpp
#sudo apt-get install libx11-dev #is this necessary,if so, perhaps also cmake?
DLIB_DIR = 'NOT SPECIFIED'
CXX = g++
CFLAGS = -O3 -lpthread -lX11 -Wall -std=c++11 -I$(DLIB_DIR)
OBJ_EXT=.o
CPP_EXT=.cpp

TARGET = hello_world_host

DLIB_SRC_DIR=$(DLIB_DIR)/dlib/all/

all: $(TARGET)
	@echo "DLIB is $(DLIB_DIR)"

SRC_DIR = ./
OBJ_DIR = $(SRC_DIR)objs
DLIB_OBJ_DIR = $(SRC_DIR)dlib_objs


$(OBJ_DIR):
	mkdir -p $@

$(DLIB_OBJ_DIR):
	mkdir -p $@

$(OBJS): $(OBJ_DIR)/%$(OBJ_EXT): $(SRC_DIR)%$(CPP_EXT) | $(OBJ_DIR)
	$(CXX)  $< -c -o $@  $(CFLAGS)

$(DLIB_OBJS): $(DLIB_OBJ_DIR)/%$(OBJ_EXT): $(DLIB_SRC_DIR)%$(CPP_EXT) | $(DLIB_OBJ_DIR)
	$(CXX)  $< -c -o $@  $(CFLAGS)

$(TARGET): $(SRCDIR)hello_world$(CPP_EXT) $(DLIB_SRC_DIR)source$(CPP_EXT) $(OBJS) $(DLIB_OBJS)
	$(CXX) $< -o $@ $(OBJS) $(DLIB_OBJS) $(CFLAGS)

clean:
	rm $(TARGET) $(OBJS)



