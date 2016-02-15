#
# Usage:
#	cmd_md5_string(<source> <value>)
#	cmd_md5(<source> <value>)
#
function(cmd_md5_string source value)
	set(md5_value)
	string(MD5 md5_value ${source})
	set(${value} ${md5_value} PARENT_SCOPE)
endfunction()

function(cmd_md5 source value)
	cmd_absolute(source)
	set(md5_value)
	if(EXISTS ${source})
		if(IS_DIRECTORY ${source})
			file(GLOB sub_sources ${source}/*)
			foreach(sub_source ${sub_sources})
				cmd_md5(${sub_source} sub_source_md5)
				set(md5_value ${md5_value}${sub_source_md5})
			endforeach()
			if(md5_value)
				cmd_md5_string(${md5_value} md5_value)
			endif()
		else()
			file(MD5 ${source} md5_value)
		endif()
	endif()
	set(${value} ${md5_value} PARENT_SCOPE)
endfunction()