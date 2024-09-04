project(parser)

SET(CMAKE_CXX_FLAGS "-std=c++20")
file(GLOB PARSER_SRC *.h *.cpp)

add_library(parser SHARED ${PARSER_SRC})
target_link_libraries(parser mysqlclient)
