cmake_minimum_required(VERSION 3.30)
project(
    CnC_Red_Alert
    VERSION 1.5.9.408
    DESCRIPTION "Command & Conquer Red Alert"
    HOMEPAGE_URL "https://github.com/electronicarts/CnC_Red_Alert"
    LANGUAGES C CXX ASM_MASM
)

macro(set_asm_masm_source_file_properties)
  file(GLOB
    PROJECT_COMPONENT_ASM_MASM_SOURCE_FILES
    RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
    "*.ASM"
    "*.16"
  )
  set_source_files_properties(
    ${PROJECT_COMPONENT_ASM_MASM_SOURCE_FILES}
    PROPERTIES
      LANGUAGE ASM_MASM
      COMPILE_OPTIONS "$<$<CONFIG:Debug>:/Zd>"
  )
endmacro(set_asm_masm_source_file_properties)

add_subdirectory(IPX)
# add_subdirectory(LAUNCH)
add_subdirectory(LAUNCHER)
add_subdirectory(TOOLS/AUDIOMAK)
