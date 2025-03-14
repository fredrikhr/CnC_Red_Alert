cmake_minimum_required(VERSION 3.30)
project(
  CnC_Red_Alert
  DESCRIPTION "Command & Conquer Red Alert"
  HOMEPAGE_URL "https://github.com/electronicarts/CnC_Red_Alert"
  LANGUAGES C CXX ASM_MASM
)

list(APPEND CMAKE_ASM_MASM_SOURCE_FILE_EXTENSIONS "ASM")
list(APPEND CMAKE_ASM_MASM_IGNORE_EXTENSIONS "I" "INC" "16")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMAKE")
include(language_file_extensions)
set_enabled_language_file_extensions()
