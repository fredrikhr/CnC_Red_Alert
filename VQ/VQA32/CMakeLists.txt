file_glob_enabled_languages_source_files()

add_library(VQA32 STATIC)
target_compile_definitions(VQA32
  PUBLIC PHARLAP_TNT=0
)
target_include_directories(VQA32
  PUBLIC
    "../INCLUDE"
    "../INCLUDE/VQA32"
)
target_sources(VQA32 PRIVATE ${PROJECT_ANY_LANG_SOURCE_FILES})
target_sources(VQA32
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
