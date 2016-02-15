
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/include.cmake)
func_import_source(src src_files .c)
plat_exe(luaP ${src_files})
func_import_target(lua)
add_dependencies(luaP lua)
target_link_libraries(luaP lua)
func_export_target(luaP)
