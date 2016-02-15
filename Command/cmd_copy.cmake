#
# Usage:
#	cmd_copy(<source> <destination>)
#	cmd_cp(<source> <destination>)
#
function(cmd_copy source destination)
	cmd_absolute(source destination)
	if(EXISTS ${source})
		if((NOT IS_DIRECTORY ${source}) AND (IS_DIRECTORY ${destination}))
			file(COPY ${source} DESTINATION ${destination} 
				 PATTERN "*[.]svn" EXCLUDE 
				 PATTERN "*[.]git" EXCLUDE 
				 PATTERN "[.]DS_Store" EXCLUDE)
		elseif((NOT EXISTS ${destination}) OR (NOT IS_DIRECTORY ${destination}))
			get_filename_component(source_name ${source} NAME)
			get_filename_component(destination_path ${destination} PATH)
			get_filename_component(destination_name ${destination} NAME)
			file(COPY ${source} DESTINATION ${destination_path}/${source_name}-temp
				 PATTERN "*[.]svn" EXCLUDE 
				 PATTERN "*[.]git" EXCLUDE 
				 PATTERN "[.]DS_Store" EXCLUDE)
			cmd_move(${destination_path}/${source_name}-temp/${source_name} ${destination})
			cmd_delete(${destination_path}/${source_name}-temp)
		else()
			file(GLOB sub_sources ${source}/*)
			foreach(sub_source ${sub_sources})
				get_filename_component(sub_source_name ${sub_source} NAME)
				cmd_copy(${sub_source} ${destination}/${sub_source_name})
			endforeach()
		endif()
	elseif(${source} MATCHES "[*|?]")
		file(GLOB_RECURSE sub_sources ${source})
		if(sub_sources)
			get_filename_component(source_path ${source} PATH)
			string(LENGTH ${source_path} source_path_length)
			foreach(sub_source ${sub_sources})
				get_filename_component(sub_source_path ${sub_source} PATH)
				string(SUBSTRING ${sub_source_path} ${source_path_length} -1 sub_source_path_substring)
				file(COPY ${sub_source} DESTINATION ${destination}${sub_source_path_substring})
			endforeach()
		endif()
	endif()
endfunction()

function(cmd_cp source destination)
	cmd_copy(${source} ${destination})
endfunction()
