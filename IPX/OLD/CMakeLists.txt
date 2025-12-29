file_glob_enabled_languages_source_files()

if(WITH_16BIT_TARGETS)
add_library(IPX16A_OLD OBJECT IPX16A.ASM)
target_include_directories(IPX16A_OLD
  PRIVATE
    ..
)
target_sources(IPX16A_OLD
  PRIVATE
    FILE_SET HEADERS
    BASE_DIRS ..
    FILES ../PCMACRO.16
)
endif(WITH_16BIT_TARGETS)

set_asm_masm_source_files_language_property()
