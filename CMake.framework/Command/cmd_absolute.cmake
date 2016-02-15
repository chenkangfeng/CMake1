#
# Usage:
#	cmd_absolute([<path> ...])
#
if(cmd_absolute_uid)
	string(RANDOM cmd_absolute_uid)
endif()
function(cmd_absolute)
	foreach(${cmd_absolute_uid}_directory ${ARGN})
		get_filename_component(absolute_directory ${${${cmd_absolute_uid}_directory}} ABSOLUTE)
		set(${${cmd_absolute_uid}_directory} ${absolute_directory} PARENT_SCOPE)
	endforeach()
endfunction()
