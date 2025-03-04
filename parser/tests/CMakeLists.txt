project(tests)

add_compile_definitions(DATA_DIR="${CMAKE_CURRENT_BINARY_DIR}/data")
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/data DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

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
