#
# Usage:
#	cmd_write(<source> <value> [CREATE])
#
function(cmd_write source value)
	cmd_absolute(source)
	set(parse_params CREATE)
	cmd_parse(parse_params ${ARGN})
	if((EXISTS ${source}) OR CREATE-FOUND)
		file(WRITE ${source} ${value})
	endif()
endfunction()
