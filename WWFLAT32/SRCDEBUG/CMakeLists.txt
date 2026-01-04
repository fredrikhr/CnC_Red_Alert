file_glob_enabled_language_files()

add_library(WWFLAT32_SRCDEBUG OBJECT)
target_include_directories(WWFLAT32_SRCDEBUG
  PRIVATE ../INCLUDE
)
target_sources(WWFLAT32_SRCDEBUG
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WWFLAT32_SRCDEBUG
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
