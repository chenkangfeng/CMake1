#
# Usage:
#	plat_lib(<lib_name> <lib_type> [<file1> ...])
#
macro(plat_lib lib_name lib_type)
	project(${lib_name})
	if(lib_type STREQUAL "SHARED")
		string(TOUPPER ${lib_name} upper_lib_name)
		add_definitions(-D${upper_lib_name}_AS_DLL)
		add_definitions(-D${upper_lib_name}_EXPORT)
	endif()
	if(CMAKE_WIN_PLATFORM)
		add_definitions(-we4715)
		add_definitions(-Zm200)
		add_library(${lib_name} ${lib_type} ${ARGN})
	elseif(CMAKE_IOS_PLATFORM)
		set(CMAKE_OSX_SYSROOT "iphoneos")
		set(MACOSX_BUNDLE_BUNDLE_NAME ${exe_name})
		set(CMAKE_XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2")
		set(CMAKE_XCODE_ATTRIBUTE_SKIP_INSTALL "NO")
		add_library(${lib_name} STATIC ${ARGN})
		set_target_properties(${lib_name} PROPERTIES
			XCODE_ATTRIBUTE_VALIDATE_PRODUCT "YES"
			XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
			XCODE_ATTRIBUTE_INSTALL_PATH "$(LOCAL_LIBRARY_DIR)")
	endif()
endmacro()
