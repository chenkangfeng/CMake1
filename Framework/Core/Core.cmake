
IF(INCLUDE_CORE_CMAKE)
	RETURN()
ENDIF()
SET(INCLUDE_CORE_CMAKE TRUE)

INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Param/Param.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Param/ParamArray.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Param/ParamMap.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Param/ParamParse.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Tool/AbsolutePath.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Tool/ExecuteCmd.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdCp.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdEcho.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdLs.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdMD5.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdMkdir.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdMv.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdPWD.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdRead.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdRm.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdTar.cmake)
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/Shell/CmdWrite.cmake)