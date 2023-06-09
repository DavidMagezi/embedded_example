#change DLIB_DIR to where you downloaded d-lib
LOCAL_DIR = /home/$(USER)/local
DLIB_DIR = $(LOCAL_DIR)/dlib/source/dlib-19.24
MNIST_DIR = $(LOCAL_DIR)/mnist 

CXX = g++
CFLAGS = -O3 -lpthread -lX11 -std=c++17 -I$(DLIB_DIR)
OBJ_EXT = .o
CPP_EXT =.cpp

BASE_DIR = ./
EXEC_DIR = $(BASE_DIR)bin
SRC_DIR = $(BASE_DIR)src
OBJ_DIR =$(BASE_DIR)objs

DLIB_SRC=$(DLIB_DIR)/dlib/all/source

TARGET_STEM = train_model
TARGET = $(EXEC_DIR)/$(TARGET_STEM)

_ML = machine_learning
_ML_DEPS = my_logger.h my_mnist.h

ML_OBJ_DIR = $(OBJ_DIR)/$(_ML)
ML_SRC_DIR = $(SRC_DIR)/$(_ML)
ML_DEPS = $(addprefix $(ML_SRC_DIR)/, $(_ML_DEPS))
_ML_OBJS = $(_ML_DEPS:.h=.o) 
ML_OBJS = $(addprefix $(ML_OBJ_DIR)/, $(_ML_OBJS))

all: $(TARGET)
	@echo "DLIB is $(DLIB_DIR)"
	@echo "DLIB_SRC is $(DLIB_SRC)"

$(EXEC_DIR):
	mkdir -p $@

$(ML_OBJ_DIR):
	mkdir -p $@

$(ML_OBJS): $(ML_OBJ_DIR)/%$(OBJ_EXT): $(ML_SRC_DIR)/%$(CPP_EXT) $(DLIB_SRC)$(CPP_EXT) $(ML_DEPS) | $(ML_OBJ_DIR)
	$(CXX)  $< -c -o $@  $(CFLAGS) -iquote$(ML_SRC_DIR) 

$(TARGET): $(SRC_DIR)/$(TARGET_STEM)$(CPP_EXT) $(DLIB_SRC)$(CPP_EXT) $(ML_OBJS) | $(EXEC_DIR)
	@echo "Building $(TARGET) ..."
	$(CXX) $< -o $@ $(DLIB_SRC)$(CPP_EXT) $(ML_OBJS) $(CFLAGS)

clean:
	rm $(TARGET) $(ML_OBJS)
	rmdir $(EXEC_DIR) $(ML_OBJ_DIR) $(OBJ_DIR)

run:
	@echo "MNIST directory is $(MNIST_DIR)"
	$(TARGET) $(MNIST_DIR)

