file_glob_enabled_languages_source_files()

add_executable(LAUNCHER WIN32)
list(REMOVE_ITEM
  PROJECT_ANY_LANG_SOURCE_FILES
  "256BMP.C"
)

target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Debug>:_DEBUG>
)
target_sources(LAUNCHER
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
    REDALERT.ICO
)
target_sources(LAUNCHER
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)
install(TARGETS LAUNCHER)

add_subdirectory(UTIL)
