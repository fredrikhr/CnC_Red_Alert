file_glob_enabled_language_files()

add_executable(WWFLAT32_EXAMPLE)
target_sources(WWFLAT32_EXAMPLE
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WWFLAT32_EXAMPLE
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
# target_link_libraries(WWFLAT32_EXAMPLE PRIVATE WWFLAT32)

set_asm_masm_source_files_language_property()
