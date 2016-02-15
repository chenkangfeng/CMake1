
cmake_minimum_required(VERSION 2.8)
include($ENV{CMAKE_FRAMEWORK}/include.cmake)
func_import_source(. src_files DIRECTORY
				   . actions base_nodes cocoa draw_nodes effects include
				   kazmath/include/kazmath kazmath/include/kazmath/GL
				   kazmath/src kazmath/src/GL keypad_dispatcher label_nodes
				   layers_scenes_transitions_nodes menu_nodes misc_nodes 
				   particle_nodes platform platform/ios platform/ios/Simulation
				   platform/third_party/ios/curl platform/third_party/ios/webp
				   script_support shaders sprite_nodes support support/component 
				   support/data_support support/image_support support/tinyxml2 
				   support/user_default support/zip_support text_input_node textures 
				   tilemap_parallax_nodes touch_dispatcher
				   EXTENSION .h .c .cpp .m .mm)
add_definitions(-DCOCOS2D_JAVASCRIPT)
add_definitions(-DUSE_FILE32API)
add_definitions(-DCC_TARGET_OS_IPHONE)
plat_lib(cocos2dx SHARED ${src_files})
set_target_properties(cocos2dx PROPERTIES 
					  XCODE_ATTRIBUTE_GCC_PREFIX_HEADER ./precompiled/ios/cocos2dx-Prefix.pch
					  XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER YES
					  XCODE_ATTRIBUTE_OTHER_LDFLAGS "-ObjC -all_load")
target_include_directories(cocos2dx PUBLIC .)
target_include_directories(cocos2dx PUBLIC include)
target_include_directories(cocos2dx PUBLIC kazmath/include)
target_include_directories(cocos2dx PUBLIC platform/ios)
target_include_directories(cocos2dx PUBLIC platform/third_party/ios)
target_link_libraries(cocos2dx Foundation.framework)
target_link_libraries(cocos2dx platform/third_party/ios/libraries/libcurl.a)
target_link_libraries(cocos2dx platform/third_party/ios/libraries/libwebp.a)
func_export_target(cocos2dx)
