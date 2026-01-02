file_glob_enabled_languages_source_files()

add_library(WIN32LIB_KEYBOARD_OLD OBJECT)
target_include_directories(WIN32LIB_KEYBOARD_OLD
  PRIVATE ../../INCLUDE
)
target_sources(WIN32LIB_KEYBOARD_OLD
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
)
target_sources(WIN32LIB_KEYBOARD_OLD
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
