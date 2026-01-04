file_glob_enabled_language_files()

add_executable(VQAVIEW)
target_include_directories(VQAVIEW
  PRIVATE
    ../INCLUDE
)
target_sources(VQAVIEW
  PRIVATE ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(VQAVIEW
  PRIVATE
    FILE_SET private_headers
    TYPE HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
file_glob_enabled_language_files_in_directory(VQ_INCLUDE ../INCLUDE)
list(TRANSFORM PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES PREPEND ../INCLUDE/)
target_sources(VQAVIEW
  PRIVATE
    FILE_SET HEADERS
    BASE_DIRS
      ../INCLUDE
    FILES
      ${PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES}
)
target_link_libraries(VQAVIEW PRIVATE WINVQA32)
install(TARGETS VQAVIEW)
