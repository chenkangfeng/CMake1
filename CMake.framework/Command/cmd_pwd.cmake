#
# Usage:
#	cmd_pwd(<directory>)
#
function(cmd_pwd directory)
	set(current_directory)
	execute_process(COMMAND cmake -E chdir . pwd OUTPUT_VARIABLE current_directory)
	string(REGEX REPLACE "\n|\r" "" current_directory ${current_directory})
	set(${directory} ${current_directory} PARENT_SCOPE)
endfunction()
