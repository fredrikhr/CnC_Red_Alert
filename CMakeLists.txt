cmake_minimum_required(VERSION 3.30)
project(
    CnC_Red_Alert
    VERSION 1.5.9.408
    DESCRIPTION "Command & Conquer Red Alert"
    HOMEPAGE_URL "https://github.com/electronicarts/CnC_Red_Alert"
    LANGUAGES C CXX ASM_MASM
)
list(APPEND CMAKE_ASM_MASM_SOURCE_FILE_EXTENSIONS "ASM")
list(APPEND CMAKE_ASM_MASM_IGNORE_EXTENSIONS "I" "INC")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")

include(language_file_extensions)
set_file_extensions_local_globs()

option(PHARLAP_TNT "PHARLAP_TNT" OFF)

add_subdirectory(LAUNCH)
add_subdirectory(LAUNCHER)

add_subdirectory(TOOLS/AUDIOMAK)
add_subdirectory(TOOLS/MIX)

add_subdirectory(VQ/VQA32)
add_subdirectory(VQ/VQM32)
add_subdirectory(WINVQ/VPLAY32)
add_subdirectory(WINVQ/VQA32)
add_subdirectory(WINVQ/VQA32/OLD)
add_subdirectory(WINVQ/VQAVIEW)
add_subdirectory(WINVQ/VQM32)

add_subdirectory(WWFLAT32)
