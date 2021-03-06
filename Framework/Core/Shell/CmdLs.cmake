#
# Usage:
#	Cmd_Ls(<DIRECTORY> <CONTENTS>)
#
FUNCTION(CMD_LS DIRECTORY CONTENTS)
	ABSOLUTE_PATH(DIRECTORY)
	SET(SUB_SOURCES)
	IF(IS_DIRECTORY ${DIRECTORY})
		FILE(GLOB SUB_SOURCES ${DIRECTORY}/*)
	ELSEIF(${DIRECTORY} MATCHES "[*|?]")
		FILE(GLOB SUB_SOURCES ${DIRECTORY})
	ENDIF()
	SET(FILE_LIST)
	SET(FOLDER_LIST)
	SET(CONTENT_LIST)
	FOREACH(SUB_SOURCE ${SUB_SOURCES})
		IF(IS_DIRECTORY ${SUB_SOURCE})
			LIST(APPEND FOLDER_LIST ${SUB_SOURCE})
		ELSE()
			LIST(APPEND FILE_LIST ${SUB_SOURCE})
		ENDIF()
		LIST(APPEND CONTENT_LIST ${SUB_SOURCE})
	ENDFOREACH()
	SET(${CONTENTS} ${CONTENT_LIST} PARENT_SCOPE)
	SET(${CONTENTS}-FILE ${FILE_LIST} PARENT_SCOPE)
	SET(${CONTENTS}-FOLDER ${FOLDER_LIST} PARENT_SCOPE)
ENDFUNCTION()
