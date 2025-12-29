file_glob_enabled_languages_source_files()

add_library(WWFLAT32_KEYBOARD_X OBJECT)
target_include_directories(WWFLAT32_KEYBOARD_X
  PRIVATE ../../INCLUDE
)
target_sources(WWFLAT32_KEYBOARD_X
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
)
target_sources(WWFLAT32_KEYBOARD_X
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
