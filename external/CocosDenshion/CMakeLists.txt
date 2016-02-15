
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/include.cmake)
func_import_source(. src_files DIRECTORY
				   . include ios
				   EXTENSION .h .cpp .m .mm)
add_definitions(-DCC_TARGET_OS_IPHONE)
plat_lib(CocosDenshion SHARED ${src_files})
set_target_properties(CocosDenshion PROPERTIES XCODE_ATTRIBUTE_OTHER_LDFLAGS "-ObjC")
func_import_target(cocos2dx)
target_include_directories(CocosDenshion PUBLIC include)
target_link_libraries(CocosDenshion cocos2dx)
func_export_target(CocosDenshion)
