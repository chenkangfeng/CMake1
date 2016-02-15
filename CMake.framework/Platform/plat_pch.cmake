#
# Usage:
#	plat_pch(<pch_path>)
#
macro(plat_pch pch_path)
	if(CMAKE_WIN_PLATFORM)
	elseif(CMAKE_IOS_PLATFORM)
	endif()
endmacro()
