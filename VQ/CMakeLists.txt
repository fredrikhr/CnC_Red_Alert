file_glob_enabled_language_files_in_directory(
  VQ_INCLUDE
  "INCLUDE"
)
file_glob_enabled_language_files_in_directory(
  VQA32_INCLUDE
  "INCLUDE/VQA32"
)
file_glob_enabled_language_files_in_directory(
  VQM32_INCLUDE
  "INCLUDE/VQM32"
)

add_library(VQ_INCLUDE INTERFACE)
target_include_directories(VQ_INCLUDE
  INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
)
target_sources(VQ_INCLUDE
  PRIVATE
    ${PROJECT_VQ_INCLUDE_ANY_LANG_SOURCE_FILES}
)
target_sources(VQ_INCLUDE
  INTERFACE
    FILE_SET HEADERS
    FILES
      ${PROJECT_VQ_INCLUDE_ANY_LANG_IGNORES}
)

add_subdirectory(VQA32)
add_subdirectory(VQM32)
