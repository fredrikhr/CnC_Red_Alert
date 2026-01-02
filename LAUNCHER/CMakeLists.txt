file_glob_enabled_languages_source_files()

add_library(256BMP OBJECT 256BMP.C)
target_compile_definitions(256BMP PRIVATE
  huge=
  _export=
  farmalloc=malloc
  farfree=free
)
list(REMOVE_ITEM
  PROJECT_ANY_LANG_SOURCE_FILES
  "256BMP.C"
)

add_executable(LAUNCHER WIN32)
target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
)
target_sources(LAUNCHER
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
    $<TARGET_OBJECTS:256BMP>
    REDALERT.ICO
)
target_sources(LAUNCHER
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)
install(TARGETS LAUNCHER)

add_subdirectory(UTIL)
