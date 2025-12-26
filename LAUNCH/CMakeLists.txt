add_executable(LAUNCH WIN32)
target_sources(LAUNCH
  PRIVATE
    LAUNCH.ASM
)
target_sources(LAUNCH
  PRIVATE
    FILE_SET local_headers
    TYPE HEADERS
    FILES PCMACRO.16
)
set_source_files_properties(
  LAUNCH.ASM
  PCMACRO.16
  PROPERTIES
    LANGUAGE ASM_MASM
)
install(TARGETS LAUNCH)
