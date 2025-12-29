add_executable(LAUNCHER WIN32)
file(GLOB
  CnC_Red_Alert_LAUNCHER_SOURCES_FILES
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  "*.C"
  "*.CPP"
  "*.RC"
)
list(REMOVE_ITEM
  CnC_Red_Alert_LAUNCHER_SOURCES_FILES
  "256BMP.C"
)
file(GLOB
  CnC_Red_Alert_LAUNCHER_HEADER_FILES
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  "*.H"
)

target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Debug>:_DEBUG>
)
target_sources(LAUNCHER
  PRIVATE
    ${CnC_Red_Alert_LAUNCHER_SOURCES_FILES}
    REDALERT.ICO
)
target_sources(LAUNCHER
  PRIVATE
    FILE_SET local_headers
    TYPE HEADERS
    FILES
      ${CnC_Red_Alert_LAUNCHER_HEADER_FILES}
)
install(TARGETS LAUNCHER)

set_asm_masm_source_file_properties()

if(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
add_subdirectory(UTIL)
endif(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
