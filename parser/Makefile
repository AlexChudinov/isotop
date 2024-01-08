INCLUDE_DIRS=-I.
LINK_DIRS=-L./build
LINK_LIBS=-lmysqlclient

LINK_TEST_LIBS=$(LINK_LIBS) -lgtest -lmysql

SRCS=main.cpp mysql.cpp parser.cpp distribution.cpp

TEST_SRCS=tests/main.cpp\
	tests/test_database.cpp\
	tests/test_distribution.cpp\
	tests/test_parser.cpp\
	tests/common.cpp

CXX_FLAGS=-fPIC -std=c++20 -Wall

build:
	mkdir -p build
	g++ $(CXX_FLAGS) $(SRCS) -o build/parser $(LINK_DIRS) $(LINK_LIBS) -O3

test:
	mkdir -p build
	g++ $(SRCS) -shared $(CXX_FLAGS) $(LINK_LIBS) -o build/libmysql.so -Og -ggdb
	g++ $(TEST_SRCS) $(CXX_FLAGS) $(INCLUDE_DIRS) $(LINK_DIRS) $(LINK_TEST_LIBS) -Og -ggdb -o build/test
	cp -r tests/data build
	cd build && LD_LIBRARY_PATH=. ./test $(ARGS)

clean:
	rm -rf build
