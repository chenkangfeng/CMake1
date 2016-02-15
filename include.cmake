
if(include_cmake)
	return()
endif()
set(include_cmake true)

if(COMMAND CMAKE_POLICY)
	CMAKE_POLICY(SET CMP0003 NEW)
	CMAKE_POLICY(SET CMP0006 OLD)
	CMAKE_POLICY(SET CMP0011 OLD)
	CMAKE_POLICY(SET CMP0012 OLD)
	if(${CMAKE_VERSION} GREATER 3.0)
		CMAKE_POLICY(SET CMP0026 OLD)
		CMAKE_POLICY(SET CMP0043 NEW)
		CMAKE_POLICY(SET CMP0053 OLD)
		CMAKE_POLICY(SET CMP0054 OLD)
	endif()
endif()

include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_absolute.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_cmake.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_copy.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_delete.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_echo.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_ls.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_md5.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_mkdir.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_move.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_parse.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_pwd.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_read.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_tar.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Command/cmd_write.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Function/func_export_target.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Function/func_import_source.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Function/func_import_target.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Platform/plat_exe.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Platform/plat_lib.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Platform/plat_pch.cmake)
