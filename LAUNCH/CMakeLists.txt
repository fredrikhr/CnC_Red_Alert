if(WITH_16BIT_TARGETS)
add_executable(LAUNCH)
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
endif(WITH_16BIT_TARGETS)

set_asm_masm_source_file_properties()
