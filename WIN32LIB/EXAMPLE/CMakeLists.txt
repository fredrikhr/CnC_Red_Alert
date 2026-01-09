file_glob_enabled_language_files()

add_executable(WIN32LIB_EXAMPLE EXCLUDE_FROM_ALL)
target_sources(WIN32LIB_EXAMPLE
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WIN32LIB_EXAMPLE
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
# target_link_libraries(WIN32LIB_EXAMPLE PRIVATE WIN32LIB)

set_asm_masm_source_files_language_property()
