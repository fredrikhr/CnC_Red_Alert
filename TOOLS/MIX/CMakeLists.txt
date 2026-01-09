file_glob_enabled_language_files()

add_executable(MIXFILE)
target_compile_definitions(MIXFILE
  PRIVATE
    MAXPATH=MAX_PATH
    MAXDRIVE=_MAX_DRIVE
    MAXDIR=_MAX_DIR
    MAXFILE=_MAX_FNAME
    MAXEXT=_MAX_EXT
    fnsplit=_splitpath_s
    fnmerge=_makepath_s
)
target_sources(MIXFILE
  PRIVATE
    ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_SOURCE_FILES}
)
target_sources(MIXFILE
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_CURRENT_SOURCE_DIR_ANY_LANG_IGNORES}
)
