file_glob_enabled_language_files_in_directory(
  WINVQ_INCLUDE
  "INCLUDE"
)
file_glob_enabled_language_files_in_directory(
  WINVQA32_INCLUDE
  "INCLUDE/VQA32"
)
file_glob_enabled_language_files_in_directory(
  WINVQM32_INCLUDE
  "INCLUDE/VQM32"
)

add_library(WINVQ_INCLUDE INTERFACE)
target_include_directories(WINVQ_INCLUDE
  INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
)
target_sources(WINVQ_INCLUDE
  PRIVATE
    ${PROJECT_WINVQ_INCLUDE_ANY_LANG_SOURCE_FILES}
)
target_sources(WINVQ_INCLUDE
  INTERFACE
    FILE_SET HEADERS
    FILES
      ${PROJECT_WINVQ_INCLUDE_ANY_LANG_IGNORES}
)

add_subdirectory(VQA32)
add_subdirectory(VQM32)
add_subdirectory(VQAVIEW)
add_subdirectory(VPLAY32)
