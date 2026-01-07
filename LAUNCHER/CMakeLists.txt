file_glob_enabled_language_files()
list(REMOVE_ITEM
  PROJECT_CURRENT_SOURCE_DIR_C_SOURCE_FILES
  "${CMAKE_CURRENT_SOURCE_DIR}/256BMP.C"
)
list(REMOVE_ITEM
  PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES
  "${CMAKE_CURRENT_SOURCE_DIR}/256BMP.C"
)

add_library(LAUNCHER_256BMP STATIC EXCLUDE_FROM_ALL 256BMP.C)
target_compile_definitions(LAUNCHER_256BMP PRIVATE
  huge=
  _export=
  farmalloc=malloc
  farfree=free
)

add_executable(LAUNCHER WIN32)
target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
)
target_sources(LAUNCHER
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
    REDALERT.ICO
)
target_sources(LAUNCHER
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
install(TARGETS LAUNCHER)

add_subdirectory(UTIL)
