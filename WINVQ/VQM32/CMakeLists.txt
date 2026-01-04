file_glob_enabled_language_files()

add_library(WINVQM32 STATIC)
target_compile_definitions(WINVQM32
  PUBLIC
    PHARLAP_TNT=0
)
target_include_directories(WINVQM32
  PUBLIC
    ../INCLUDE
    ../INCLUDE/VQM32
)
target_sources(WINVQM32
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WINVQM32
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
file_glob_enabled_language_files_in_directory(WINVQ_INCLUDE ../INCLUDE)
file_glob_enabled_language_files_in_directory(WINVQM32_INCLUDE ../INCLUDE/VQM32)
list(TRANSFORM PROJECT_WINVQ_INCLUDE_ANY_LANG_IGNORES
  PREPEND ../INCLUDE/
)
list(TRANSFORM PROJECT_WINVQM32_INCLUDE_ANY_LANG_IGNORES
  PREPEND ../INCLUDE/VQM32/
)
target_sources(WINVQM32
  PRIVATE
    FILE_SET include
    TYPE HEADERS
    BASE_DIRS ../INCLUDE
    FILES
      ${PROJECT_WINVQ_INCLUDE_ANY_LANG_IGNORES}
      ${PROJECT_WINVQM32_INCLUDE_ANY_LANG_IGNORES}
)
if(USE_WINVQ_AS_VQ)
add_library(VQM32 ALIAS WINVQM32)
endif(USE_WINVQ_AS_VQ)

set_asm_masm_source_files_language_property()
