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
install(TARGETS LAUNCH)

set_asm_masm_source_file_properties()
