#
# Usage:
#	Cmd_Mkdir(<DIRECTORY>)
#
FUNCTION(CMD_MKDIR DIRECTORY)
	ABSOLUTE_PATH(DIRECTORY)
	IF(NOT EXISTS ${DIRECTORY})
		FILE(MAKE_DIRECTORY ${DIRECTORY})
	ENDIF()
ENDFUNCTION()