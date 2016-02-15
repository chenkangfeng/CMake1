
set(CMAKE_IOS_PLATFORM YES CACHE BOOL "iOS platform." FORCE)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Supported configuration types." FORCE)
set(CMAKE_GENERATOR Xcode CACHE INTERNAL "Name of generator." FORCE)
set(CMAKE_OSX_ARCHITECTURES "$(ARCHS_STANDARD_32_BIT)" CACHE STRING "Architectures." FORCE)
set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos;-iphonesimulator" CACHE STRING "Effective platforms." FORCE)
set(CMAKE_XCODE_ATTRIBUTE_VALID_ARCHS "armv7 armv7s i386" CACHE STRING "Xcode attribute valid archs." FORCE)
set(CMAKE_TOOLCHAIN_FILE $ENV{CMAKE_FRAMEWORK}/Toolchain/ios.toolchain.cmake CACHE FILEPATH "Toolchain file." FORCE)
