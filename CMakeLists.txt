cmake_minimum_required(VERSION 3.8)
project(MSRF_CCD)

################################################################################

### Configuration
set(MSRF_CCD_EXTERNAL "${CMAKE_CURRENT_SOURCE_DIR}/external")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(Warnings)
include(UseColors)
include(MSRFDependencies)

################################################################################
# Library
################################################################################

add_library(${PROJECT_NAME} src/minimum_separation_root_finder.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC src)

################################################################################
# Required Libraries
################################################################################

# Eigen
target_link_libraries(${PROJECT_NAME} PUBLIC Eigen3::Eigen)

# Extra warnings
target_link_libraries(${PROJECT_NAME} PRIVATE warnings::all)

################################################################################
# Compiler options
################################################################################

# Use C++11
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_11)
