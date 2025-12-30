cmake_minimum_required(VERSION 3.30)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")
include(cmake_lang_extension_globs)
project(
    CnC_Red_Alert
    VERSION 1.5.9.408
    DESCRIPTION "Command & Conquer Red Alert"
    HOMEPAGE_URL "https://github.com/electronicarts/CnC_Red_Alert"
    LANGUAGES C CXX ASM_MASM
)
list(APPEND CMAKE_ASM_MASM_IGNORE_EXTENSIONS "I" "INC")
set(CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_DEBUG_INFORMATION_FORMAT_PogramDatabase "-Zd")

set_enabled_languages_file_globs()

option(WITH_16BIT_TARGETS "Enable CMake targets for legacy 16-bit components.")
option(WITH_REDUNDANT_SUBDIRECTORY_TARGETS "Enable CMake targets for duplicate, old, new or unspecified components located in sub-directories.")

add_subdirectory(IPX)
add_subdirectory(LAUNCH)
add_subdirectory(LAUNCHER)
add_subdirectory(TOOLS/AUDIOMAK)
add_subdirectory(TOOLS/MIX)
add_subdirectory(WIN32LIB)
add_subdirectory(WINVQ)
add_subdirectory(WWFLAT32)
