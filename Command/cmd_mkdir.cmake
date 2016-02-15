#
# Usage:
#	cmd_mkdir(<directory>)
#
function(cmd_mkdir directory)
	cmd_absolute(directory)
	if(NOT EXISTS ${directory})
		file(MAKE_DIRECTORY ${directory})
	endif()
endfunction()
