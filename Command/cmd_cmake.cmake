#
# Usage:
#	cmd_cmake(<path> [ARGN])
#
function(cmd_cmake path)
	cmd_absolute(path)
	if(IS_DIRECTORY ${path})
		execute_process(COMMAND cmake ${ARGN} WORKING_DIRECTORY ${path})
	endif()
endfunction()
