file_glob_enabled_languages_source_files()

add_executable(THUNK FIXTHUNK.CPP)

add_executable(IPXTEST WIN32 IPXTEST.CPP)
target_link_libraries(IPXTEST PRIVATE THIPX32)

if(WITH_16BIT_TARGETS)
add_library(IPX16 SHARED)
target_compile_options(IPX16 PRIVATE
  $<$<COMPILE_LANG_AND_ID:ASM_MASM,MSVC>:/omf>
)
target_compile_definitions(IPX16 PRIVATE
  $<$<COMPILE_LANG_AND_ID:CXX,MSVC>:__pascal=__stdcall>
  $<$<COMPILE_LANG_AND_ID:CXX,MSVC>:_export=>
)
target_sources(IPX16
  PRIVATE
    IPX.RC
    IPX16.ASM
    IPX16A.ASM
    IPX16C.CPP
)
target_sources(IPX16
  PRIVATE
    FILE_SET HEADERS
    FILES
      IPX16.H
      PCMACRO.16
)
endif(WITH_16BIT_TARGETS)

if(WITH_16BIT_TARGETS)
add_library(THIPX16 SHARED)
target_compile_options(THIPX16 PRIVATE
  $<$<COMPILE_LANG_AND_ID:ASM_MASM,MSVC>:/omf>
)
target_compile_definitions(THIPX16
  PRIVATE
    IS_16
)
target_sources(THIPX16
  PRIVATE
    IPX.RC
    THIPX.ASM
    THIPX16C.CPP
    THMAP16.ASM
    WWIPX16.ASM
)
endif(WITH_16BIT_TARGETS)

add_library(THIPX32 SHARED)
target_compile_definitions(THIPX32
  PRIVATE
    IS_32
)
target_sources(THIPX32
  PRIVATE
    IPX.RC
    THIPX.ASM
    THIPX32C.CPP
    THMAP32.ASM
    WWIPX.ASM
)

set_asm_masm_source_files_language_property()
