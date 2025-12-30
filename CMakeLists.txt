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
set(CACHE{CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_DEBUG_INFORMATION_FORMAT_ProgramDatabase}
  TYPE STRING
  VALUE "/Zd"
)

set_enabled_languages_file_globs()

option(WITH_16BIT_TARGETS "Enable CMake targets for legacy 16-bit components.")

add_library(PROJECT_DEFAULT INTERFACE)
target_compile_definitions(PROJECT_DEFAULT INTERFACE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_DEBUG>
)
target_compile_options(PROJECT_DEFAULT INTERFACE
  $<$<COMPILE_LANG_AND_ID:C,MSVC>:/Wall>
  $<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/Wall>
  $<$<COMPILE_LANG_AND_ID:ASM_MASM,MSVC>:/W3>
)

add_subdirectory(IPX)
add_subdirectory(LAUNCH)
add_subdirectory(LAUNCHER)
add_subdirectory(TOOLS/AUDIOMAK)
add_subdirectory(TOOLS/MIX)
add_subdirectory(VQ/VQA32)
add_subdirectory(VQ/VQM32)
add_subdirectory(WIN32LIB)
add_subdirectory(WINVQ)
add_subdirectory(WWFLAT32)

function(get_project_buildsystem_targets_recursive PROJECT_DIRECTORY)
  set(PROJECT_COLLECTED_BUILDSYSTEM_TARGETS ${PROJECT_BUILDSYSTEM_TARGETS})
  get_directory_property(PROJECT_CURRENT_DIRECTORY_BUILDSYSTEM_TARGETS
    DIRECTORY ${PROJECT_DIRECTORY}
    BUILDSYSTEM_TARGETS
  )
  list(APPEND PROJECT_COLLECTED_BUILDSYSTEM_TARGETS
    ${PROJECT_CURRENT_DIRECTORY_BUILDSYSTEM_TARGETS}
  )
  set(PROJECT_BUILDSYSTEM_TARGETS ${PROJECT_COLLECTED_BUILDSYSTEM_TARGETS})

  get_directory_property(PROJECT_CURRENT_DIRECTORY_SUBDIRECTORIES
    DIRECTORY ${PROJECT_DIRECTORY}
    SUBDIRECTORIES
  )
  foreach(PROJECT_SUBDIRECTORY ${PROJECT_CURRENT_DIRECTORY_SUBDIRECTORIES})
    get_project_buildsystem_targets_recursive(${PROJECT_SUBDIRECTORY})
  endforeach(PROJECT_SUBDIRECTORY)

  return(PROPAGATE PROJECT_BUILDSYSTEM_TARGETS)
endfunction(get_project_buildsystem_targets_recursive)

get_project_buildsystem_targets_recursive(${CMAKE_CURRENT_SOURCE_DIR})
foreach(PROJECT_BUILDSYSTEM_TARGET ${PROJECT_BUILDSYSTEM_TARGETS})
  get_target_property(PROJECT_BUILDSYSTEM_TARGET_TYPE
    ${PROJECT_BUILDSYSTEM_TARGET}
    TYPE
  )
  if(PROJECT_BUILDSYSTEM_TARGET_TYPE STREQUAL "INTERFACE_LIBRARY")
    continue()
  endif(PROJECT_BUILDSYSTEM_TARGET_TYPE STREQUAL "INTERFACE_LIBRARY")
  target_link_libraries(${PROJECT_BUILDSYSTEM_TARGET} PRIVATE PROJECT_DEFAULT)
endforeach(PROJECT_BUILDSYSTEM_TARGET)

