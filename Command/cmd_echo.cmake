#
# Usage:
#	cmd_echo([print|debug|error] [<contents>])
#
if(NOT DEFINED cmd_state_debug)
	set(cmd_state_debug false)
endif()
function(cmd_echo)
	set(prefix)
	if(${ARGC} GREATER 1)
		if(${ARGV0} MATCHES "^[Pp][Rr][Ii][Nn][Tt]$")
			list(APPEND prefix STATUS "[Print] ")
			list(REMOVE_AT ARGN 0)
		elseif(${ARGV0} MATCHES "^[Dd][Ee][Bb][Uu][Gg]$")
			if(NOT cmd_state_debug)
				return()
			endif()
			list(APPEND prefix STATUS "[Debug] ")
			list(REMOVE_AT ARGN 0)
		elseif(${ARGV0} MATCHES "^[Ee][Rr][Rr][Oo][Rr]$")
			list(APPEND prefix FATAL_ERROR "[Error] ")
			list(REMOVE_AT ARGN 0)
		endif()
	endif()
	if(${ARGC} GREATER 0)
		set(contents)
		foreach(content ${ARGN})
			set(contents "${contents}${content} ")
		endforeach()
		message(${prefix}${contents})
	endif()
endfunction()