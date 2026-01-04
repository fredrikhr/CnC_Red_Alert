file_glob_enabled_language_files()

if(WITH_16BIT_TARGETS)
add_executable(LAUNCH)
target_compile_options(LAUNCH
  PRIVATE
    $<$<COMPILE_LANG_AND_ID:ASM_MASM,MSVC>:/omf>
)
target_sources(LAUNCH
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(LAUNCH
  PRIVATE
    FILE_SET HEADERS
    FILES PCMACRO.16
)
install(TARGETS LAUNCH)
endif(WITH_16BIT_TARGETS)

set_asm_masm_source_files_language_property()
