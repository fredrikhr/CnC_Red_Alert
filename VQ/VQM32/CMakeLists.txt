file_glob_enabled_languages_source_files()

add_library(VQM32 STATIC)
target_compile_definitions(VQM32
  PUBLIC PHARLAP_TNT=0
)
target_include_directories(VQM32
  PUBLIC
    "../INCLUDE"
    "../INCLUDE/VQM32"
)
target_sources(VQM32 PRIVATE ${PROJECT_ANY_LANG_SOURCE_FILES})
target_sources(VQM32
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
