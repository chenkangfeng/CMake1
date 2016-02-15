
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/include.cmake)
func_import_source(src src_files .c)
plat_exe(luaC ${src_files})
func_import_target(lua)
add_dependencies(luaC lua)
target_link_libraries(luaC lua)
func_export_target(luaC)
