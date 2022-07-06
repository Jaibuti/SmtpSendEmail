cmake_minimum_required(VERSION 3.14.5)
project(Jxiepc)

set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -rdynamic -o0 -ggdb -std=c++11  -lsctp")


set(CMAKE_CXX_STANDARD 17)
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

aux_source_directory(tests DIR_SRCS)
set(LIB_SRC
    Jxiepc/smtp.cpp
    )
add_library(Jxiepc SHARED ${LIB_SRC})

add_executable(test_send tests/test_smtp.cpp)
add_dependencies(test_send Jxiepc)
target_link_libraries(test_send Jxiepc)

