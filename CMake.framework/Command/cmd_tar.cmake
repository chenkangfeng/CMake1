#
# Usage:
#	cmd_tar(<source> <destination>)
#
function(cmd_tar source destination)
	cmd_absolute(source destination)
	if(IS_DIRECTORY ${destination})
		execute_process(COMMAND cmake -E tar xvf ${source} WORKING_DIRECTORY ${destination})
	endif()
endfunction()
