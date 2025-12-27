add_executable(AUDIOMAK WIN32
  AUDIOMAK.CPP
  SCODE.ASM
)
set_source_files_properties(
  SCODE.ASM
  PROPERTIES
    LANGUAGE ASM_MASM
)
install(TARGETS AUDIOMAK)
