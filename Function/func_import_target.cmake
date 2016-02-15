#
# Usage:
#	func_import_target(<target>)
#
function(func_import_target target)
	find_package(${target} PATHS $ENV{CMAKE_FRAMEWORK}/Module NO_DEFAULT_PATH)
endfunction()
