#
# Usage:
#	cmd_delete(<source>)
#	cmd_rm(<source>)
#
function(cmd_delete source)
	cmd_absolute(source)
	if(EXISTS ${source})
		if(IS_DIRECTORY ${source})
			file(REMOVE_RECURSE ${source})
		else()
			file(REMOVE ${source})
		endif()
	elseif(${source} MATCHES "[*|?]")
		file(GLOB_RECURSE sub_sources ${source})
		foreach(sub_source ${sub_sources})
			file(REMOVE ${sub_source})
		endforeach()
	endif()
endfunction()

function(cmd_rm source)
	cmd_delete(${source})
endfunction()
