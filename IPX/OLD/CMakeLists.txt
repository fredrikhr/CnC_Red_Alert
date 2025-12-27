add_library(IPX16A_OLD OBJECT IPX16A.ASM)
target_include_directories(IPX16A_OLD
  PRIVATE
    ..
)
target_sources(IPX16A_OLD
  PRIVATE
    FILE_SET above_headers
    BASE_DIRS ..
    TYPE HEADERS
    FILES ../PCMACRO.16
)
set_source_files_properties(
  IPX16A.ASM
  ../PCMACRO.16
  PROPERTIES
    LANGUAGE ASM_MASM
)
