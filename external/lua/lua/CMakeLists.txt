
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/include.cmake)
func_import_source(inc inc_files .h)
func_import_source(src src_files .c)
plat_lib(lua SHARED ${inc_files} ${src_files})
target_include_directories(lua PUBLIC inc)
func_export_target(lua)
