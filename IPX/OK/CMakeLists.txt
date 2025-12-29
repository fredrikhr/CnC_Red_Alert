add_executable(THUNK_OK FIXTHUNK.CPP)

add_executable(IPXTEST_OK WIN32 IPXTEST.CPP)
target_link_libraries(IPXTEST_OK
  PRIVATE
    THIPX32_OK
)

if(WITH_16BIT_TARGETS)
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
endif(WITH_16BIT_TARGETS)

if(BUILD_16BIT_TARGETS)
add_library(THIPX16_OK SHARED)
target_compile_definitions(THIPX16_OK
  PRIVATE
    IS_16
)
target_sources(THIPX16_OK
  PRIVATE
    IPX.RC
    THIPX.ASM
    THIPX16C.CPP
    THMAP16.ASM
    WWIPX16.ASM
)
endif(BUILD_16BIT_TARGETS)

add_library(THIPX32_OK SHARED)
target_compile_definitions(THIPX32_OK
  PRIVATE
    IS_32
)
target_sources(THIPX32_OK
  PRIVATE
    IPX.RC
    THIPX.ASM
    THIPX32C.CPP
    THMAP32.ASM
    WWIPX.ASM
)

set_asm_masm_source_file_properties()
