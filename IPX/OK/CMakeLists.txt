add_executable(THUNK_OK FIXTHUNK.CPP)

add_executable(IPXTEST_OK WIN32 IPXTEST.CPP)

add_library(IPX16_OK SHARED)
target_sources(IPX16_OK
  PRIVATE
    IPX.RC
    IPX16.ASM
    IPX16A.ASM
    IPX16C.CPP
)
target_sources(IPX16_OK
  PRIVATE
    FILE_SET local_headers
    TYPE HEADERS
    FILES
      IPX16.H
      PCMACRO.16
)

set_asm_masm_source_file_properties()
