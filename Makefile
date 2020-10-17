SRCS = \
	main.cxx \
	main.rc

OBJS = $(subst .rc,.res,$(subst .cc,.o,$(subst .cxx,.o,$(subst .cpp,.o,$(SRCS)))))

CXXFLAGS = 
LIBS = 
TARGET = utf8
ifeq ($(OS),Windows_NT)
TARGET := $(TARGET).exe
endif

.SUFFIXES: .cpp .cxx .o .rc .res

all : $(TARGET)

$(TARGET) : $(OBJS)
	g++ -std=c++14 -o $@ $(OBJS) $(LIBS)

.cxx.o :
	g++ -std=c++14 -c $(CXXFLAGS) -I. $< -o $@

.cpp.o :
	g++ -std=c++14 -c $(CXXFLAGS) -I. $< -o $@

.rc.res :
	windres --input-format=rc --output-format=coff -o $@ $<

clean :
	rm -f *.o $(TARGET)
