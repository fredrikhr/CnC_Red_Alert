file_glob_enabled_language_files()

add_library(WIN32LIB_MEM_MSVC OBJECT)
target_include_directories(WIN32LIB_MEM_MSVC
  PRIVATE ../../INCLUDE
)
target_sources(WIN32LIB_MEM_MSVC
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WIN32LIB_MEM_MSVC
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
