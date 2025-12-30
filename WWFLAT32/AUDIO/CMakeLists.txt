cmake_path(GET CMAKE_CURRENT_SOURCE_DIR FILENAME PROJECT_SOURCE_DIR_NAME)
file_glob_enabled_languages_source_files()

target_sources(WWFLAT32 PRIVATE ${PROJECT_ANY_LANG_SOURCE_FILES})
target_sources(WWFLAT32
  PRIVATE
    FILE_SET "sub_${PROJECT_SOURCE_DIR_NAME}"
    TYPE HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()

add_subdirectory(NEW)
