file_glob_enabled_language_files()

add_library(VQA32 STATIC)
target_compile_definitions(VQA32
  PUBLIC
    PHARLAP_TNT=0
)
target_include_directories(VQA32
  PUBLIC
    "../INCLUDE/VQA32"
)
target_sources(VQA32
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(VQA32
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
target_sources(VQA32
  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS ../INCLUDE
    FILES
      ${PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES}
      ${PROJECT_VQA32_INCLUDE_ANY_LANG_IGNORES}
)
target_link_libraries(VQA32 PUBLIC VQM32)

set_asm_masm_source_files_language_property()
