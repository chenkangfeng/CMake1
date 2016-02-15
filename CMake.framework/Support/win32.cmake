
set(CMAKE_WIN_PLATFORM YES CACHE BOOL "Windows platform." FORCE)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Supported configuration types." FORCE)
set(CMAKE_GENERATOR "Visual Studio 10" CACHE INTERNAL "Name of generator." FORCE)
set(CMAKE_TOOLCHAIN_FILE $ENV{CMAKE_FRAMEWORK}/Toolchain/win.toolchain.cmake CACHE FILEPATH "Toolchain file." FORCE)
