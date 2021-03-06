#
# Usage:
#	Cmd_PWD(<DIRECTORY>)
#
FUNCTION(CMD_PWD DIRECTORY)
	SET(CURRENT_DIRECTORY)
	EXECUTE_CMD(CMAKE -E chdir . pwd OUTPUT CURRENT_DIRECTORY)
	STRING(REGEX REPLACE "\n|\r" "" CURRENT_DIRECTORY ${CURRENT_DIRECTORY})
	SET(${DIRECTORY} ${CURRENT_DIRECTORY} PARENT_SCOPE)
ENDFUNCTION()
