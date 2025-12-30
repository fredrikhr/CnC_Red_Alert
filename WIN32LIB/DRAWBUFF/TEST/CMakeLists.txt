file_glob_enabled_languages_source_files()

add_executable(WIN32LIB_DRAWBUFF_TEST)
target_include_directories(WIN32LIB_DRAWBUFF_TEST
  PRIVATE ../../INCLUDE
)
target_sources(WIN32LIB_DRAWBUFF_TEST
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
)
target_sources(WIN32LIB_DRAWBUFF_TEST
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()

add_subdirectory(TEST)
