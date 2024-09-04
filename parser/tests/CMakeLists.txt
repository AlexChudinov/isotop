project(tests)

file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/data)
add_compile_definitions(DATA_DIR="${CMAKE_BINARY_DIR}/data")

find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
SET(CMAKE_CXX_FLAGS "-std=c++20")
file(GLOB TEST_PARSER_SRC *.h *.cpp ../*h ../*.cpp)

add_executable(parser_tests ${TEST_PARSER_SRC})
target_link_libraries(
    parser_tests 
    ${GTEST_LIBRARIES} 
    ${GTEST_MAIN_LIBRARIES}
    mysqlclient
)
