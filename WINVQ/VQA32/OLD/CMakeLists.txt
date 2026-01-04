file_glob_enabled_language_files()

add_library(WINVQA32_OLD STATIC)
target_compile_definitions(WINVQA32_OLD
  PUBLIC
    PHARLAP_TNT=0
)
target_include_directories(WINVQA32_OLD
  PUBLIC
    ../../INCLUDE
    ../../INCLUDE/VQA32
)
target_sources(WINVQA32_OLD
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(WINVQA32_OLD
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
file_glob_enabled_language_files_in_directory(WINVQ_INCLUDE ../../INCLUDE)
file_glob_enabled_language_files_in_directory(WINVQA32_INCLUDE ../../INCLUDE/VQA32)
list(TRANSFORM PROJECT_WINVQ_INCLUDE_ANY_LANG_IGNORES
  PREPEND ../../INCLUDE/
)
list(TRANSFORM PROJECT_WINVQA32_INCLUDE_ANY_LANG_IGNORES
  PREPEND ../../INCLUDE/VQA32/
)
target_sources(WINVQA32_OLD
  PRIVATE
    FILE_SET HEADERS
    BASE_DIRS ../../INCLUDE
    FILES
      ${PROJECT_WINVQ_INCLUDE_ANY_LANG_IGNORES}
      ${PROJECT_WINVQA32_INCLUDE_ANY_LANG_IGNORES}
)
target_link_libraries(WINVQA32_OLD PRIVATE WINVQM32)

if(USE_WINVQ_AS_VQ)
add_library(VQA32_OLD ALIAS WINVQA32_OLD)
endif(USE_WINVQ_AS_VQ)

set_asm_masm_source_files_language_property()
