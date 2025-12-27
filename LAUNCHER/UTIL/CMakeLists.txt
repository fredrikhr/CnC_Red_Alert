add_library(LAUNCHER_UTIL OBJECT)
file(GLOB
  CnC_Red_Alert_LAUNCHER_UTIL_SOURCES_FILES
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  "*.C"
  "*.CPP"
)
file(GLOB
  CnC_Red_Alert_LAUNCHER_UTIL_HEADER_FILES
  RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}
  "*.H"
)

target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Debug>:_DEBUG>
    $<$<NOT:$<CONFIG:Debug>>:NDEBUG>
)
target_sources(LAUNCHER_UTIL
  PRIVATE
    ${CnC_Red_Alert_LAUNCHER_UTIL_SOURCES_FILES}
)
target_sources(LAUNCHER_UTIL
  PRIVATE
    FILE_SET local_headers
    TYPE HEADERS
    FILES
      ${CnC_Red_Alert_LAUNCHER_UTIL_HEADER_FILES}
)
