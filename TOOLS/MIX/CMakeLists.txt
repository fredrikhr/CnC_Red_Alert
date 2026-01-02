add_executable(MIXFILE MIXFILE.CPP)
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
