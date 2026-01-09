file_glob_enabled_language_files()

add_executable(PROFILE)
target_link_libraries(PROFILE
  PUBLIC
    WIN32LIB_INCLUDE
)
target_sources(PROFILE
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(PROFILE
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
