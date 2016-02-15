# Generated by CMake 3.3.1

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget cocos2dx)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target cocos2dx
add_library(cocos2dx STATIC IMPORTED)

set_target_properties(cocos2dx PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "/Users/aotian/workspace/v2.0/external/cocos2dx/.;/Users/aotian/workspace/v2.0/external/cocos2dx/include;/Users/aotian/workspace/v2.0/external/cocos2dx/kazmath/include;/Users/aotian/workspace/v2.0/external/cocos2dx/platform/ios;/Users/aotian/workspace/v2.0/external/cocos2dx/platform/third_party/ios"
)

# Import target "cocos2dx" for configuration "Debug"
set_property(TARGET cocos2dx APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(cocos2dx PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "Foundation.framework;platform/third_party/ios/libraries/libcurl.a;platform/third_party/ios/libraries/libwebp.a"
  IMPORTED_LOCATION_DEBUG "/Users/aotian/workspace/v2.0/proj/external/cocos2dx/Debug$(EFFECTIVE_PLATFORM_NAME)/libcocos2dx.a"
  )

# Import target "cocos2dx" for configuration "Release"
set_property(TARGET cocos2dx APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(cocos2dx PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "Foundation.framework;platform/third_party/ios/libraries/libcurl.a;platform/third_party/ios/libraries/libwebp.a"
  IMPORTED_LOCATION_RELEASE "/Users/aotian/workspace/v2.0/proj/external/cocos2dx/Release$(EFFECTIVE_PLATFORM_NAME)/libcocos2dx.a"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
