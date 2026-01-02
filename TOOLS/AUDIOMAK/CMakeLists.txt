file_glob_enabled_languages_source_files()

add_executable(AUDIOMAK WIN32
  AUDIOMAK.CPP
  SCODE.ASM
)
target_compile_definitions(AUDIOMAK
  PRIVATE
    MAXPATH=MAX_PATH
    MAXDRIVE=_MAX_DRIVE
    MAXDIR=_MAX_DIR
    MAXFILE=_MAX_FNAME
    MAXEXT=_MAX_EXT
    fnsplit=_splitpath_s
    fnmerge=_makepath_s
)

set_asm_masm_source_files_language_property()
