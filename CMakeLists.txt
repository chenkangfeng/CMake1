
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/../Framework/include.cmake)

import_source(external/lua file FILE lua.cc temp/lua.cc EXTENSION c h)
make_lib(aaa STATIC ${file})
