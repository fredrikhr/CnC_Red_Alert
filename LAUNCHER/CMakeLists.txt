add_executable(LAUNCHER WIN32)
file(GLOB
  CnC_Red_Alert_LAUNCHER_SOURCES_FILES
  "*.C"
  "*.CPP"
  "*.RC"
)
file(GLOB
  CnC_Red_Alert_LAUNCHER_HEADER_FILES
  "*.H"
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

add_subdirectory(UTIL)
