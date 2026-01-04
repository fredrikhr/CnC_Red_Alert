file_glob_enabled_language_files()

add_library(VQM32 STATIC)
target_compile_definitions(VQM32
  PUBLIC PHARLAP_TNT=0
)
target_include_directories(VQM32
  PUBLIC
    "../INCLUDE"
    "../INCLUDE/VQM32"
)
target_sources(VQM32
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(VQM32
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
file_glob_enabled_language_files_in_directory(VQ_INCLUDE ../INCLUDE)
file_glob_enabled_language_files_in_directory(VQM32_INCLUDE ../INCLUDE/VQM32)
list(TRANSFORM PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES PREPEND ../INCLUDE/)
list(TRANSFORM PROJECT_VQM32_INCLUDE_ANY_LANG_IGNORES PREPEND ../INCLUDE/VQM32/)
target_sources(VQM32
  PUBLIC
    FILE_SET HEADERS
    BASE_DIRS
      ../INCLUDE
    FILES
      ${PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES}
      ${PROJECT_VQM32_INCLUDE_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
