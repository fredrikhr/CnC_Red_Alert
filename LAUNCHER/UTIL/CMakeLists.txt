file_glob_enabled_language_files()

add_library(LAUNCHER_UTIL OBJECT)

target_compile_definitions(LAUNCHER
  PRIVATE
    _export=
    __export=
    $<$<CONFIG:Debug>:DEBUG>
    $<$<CONFIG:Debug>:_DEBUG>
)
target_sources(LAUNCHER_UTIL
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(LAUNCHER_UTIL
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
