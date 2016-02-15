#
# Usage:
#	cmd_read(<source> <value>)
#
function(cmd_read source value)
	cmd_absolute(source)
	set(source_value)
	if((EXISTS ${source}) AND (NOT IS_DIRECTORY ${source}))
		file(READ ${source} source_value)
	endif()
	set(${value} ${source_value} PARENT_SCOPE)
endfunction()
