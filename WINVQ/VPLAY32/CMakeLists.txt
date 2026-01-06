file_glob_enabled_language_files()

add_executable(VPLAY32)
target_compile_definitions(VPLAY32
  PRIVATE
    VQAMONO_ON=1
    VQAAUDIO_ON=1
    VQAVOC_ON=1
    VQAMCGA_ON=1
    VQAXMODE_ON=1
    VQAVESA_ON=1
)
target_include_directories(VPLAY32
  PRIVATE
    ../INCLUDE
)
target_sources(VPLAY32
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(VPLAY32
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
file_glob_enabled_language_files_in_directory(VQ_INCLUDE ../INCLUDE)
list(TRANSFORM PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES PREPEND ../INCLUDE/)
target_sources(VPLAY32
  PRIVATE
    FILE_SET HEADERS
    BASE_DIRS
      ../INCLUDE
    FILES
      ${PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES}
)
target_link_libraries(VPLAY32
  PRIVATE
    WINVQM32
    WINVQA32
)
install(TARGETS VPLAY32)
