file_glob_enabled_language_files()

add_executable(WIN32LIB_KEYBOARD_TEST)
target_include_directories(WIN32LIB_KEYBOARD_TEST
  PRIVATE ../../INCLUDE
)
target_sources(WIN32LIB_KEYBOARD_TEST
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WIN32LIB_KEYBOARD_TEST
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
