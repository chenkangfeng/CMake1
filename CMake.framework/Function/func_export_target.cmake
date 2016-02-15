#
# Usage:
#	func_export_target(<target>)
#
function(func_export_target target)
	export(TARGETS ${target} FILE $ENV{CMAKE_FRAMEWORK}/Module/${target}Config.cmake)
endfunction()
