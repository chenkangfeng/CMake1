#
# Usage:
#	plat_exe(<exe_name> [<file1> ...])
#
macro(plat_exe exe_name)
	project(${exe_name})
	if(CMAKE_WIN_PLATFORM)
		add_definitions(-we4715)
		add_definitions(-Zm200)
		set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /subsystem:windows")
		add_executable(${exe_name} ${ARGN})
	elseif(CMAKE_IOS_PLATFORM)
		set(CMAKE_OSX_SYSROOT "iphoneos")
		set(MACOSX_BUNDLE_BUNDLE_NAME ${exe_name})
		set(CMAKE_XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2")
		set(CMAKE_XCODE_ATTRIBUTE_SKIP_INSTALL "NO")
		add_executable(${exe_name} MACOSX_BUNDLE ${ARGN})
		set_target_properties(${exe_name} PROPERTIES
			XCODE_ATTRIBUTE_VALIDATE_PRODUCT "YES"
			XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES "NO"
			XCODE_ATTRIBUTE_INSTALL_PATH "$(LOCAL_APPS_DIR)"
			XCODE_ATTRIBUTE_CODE_SIGN_RESOURCE_RULES_PATH "$(SDKROOT)/ResourceRules.plist")
	endif()
endmacro()
