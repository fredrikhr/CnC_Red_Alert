add_library(LAUNCHER_UTIL OBJECT)
file(GLOB
  CnC_Red_Alert_LAUNCHER_UTIL_SOURCES_FILES
  "*.C"
  "*.CPP"
)
file(GLOB
  CnC_Red_Alert_LAUNCHER_UTIL_HEADER_FILES
  "*.H"
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
