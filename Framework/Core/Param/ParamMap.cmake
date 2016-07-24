#
# Param_Map
#
MACRO(PARAM_MAP_ADD PARAM KEY VALUE)
	SET(${PARAM}-${KEY} ${VALUE})
	IF(DEFINED ${PARAM}-KEYS)
		LIST(FIND ${PARAM}-KEYS ${KEY} KEY_POSITION)
		IF(${KEY_POSITION} EQUAL -1)
			LIST(APPEND ${PARAM}-KEYS ${KEY})
		ENDIF()
	ELSE()
		SET(${PARAM}-KEYS ${KEY})
	ENDIF()
ENDMACRO()

MACRO(PARAM_MAP_DEL PARAM KEY)
	UNSET(${PARAM}-${KEY})
	IF(DEFINED ${PARAM}-KEYS)
		LIST(REMOVE_ITEM ${PARAM}-KEYS ${KEY})
	ENDIF()
ENDMACRO()