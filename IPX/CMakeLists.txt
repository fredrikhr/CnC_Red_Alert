file_glob_enabled_languages_source_files()

add_executable(THUNK FIXTHUNK.CPP)

add_executable(IPXTEST WIN32 IPXTEST.CPP)
target_link_libraries(IPXTEST
  PRIVATE
    THIPX32
)

if(BUILD_16BIT_TARGETS)
add_library(IPX16 SHARED)
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
endif(BUILD_16BIT_TARGETS)

if(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
if(BUILD_16BIT_TARGETS)
add_library(OLTHIPX16 OBJECT)
target_sources(OLTHIPX16
  PUBLIC
    OLTHIPX.ASM
)
target_compile_definitions(OLTHIPX16
  PRIVATE
    IS_16
)
endif(BUILD_16BIT_TARGETS)
endif(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)

if(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
add_library(OLTHIPX32 OBJECT)
target_compile_definitions(OLTHIPX32
  PUBLIC
    IS_32
)
target_sources(OLTHIPX32
  PRIVATE
    OLTHIPX.ASM
)
endif(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)

if(BUILD_16BIT_TARGETS)
add_library(THIPX16 SHARED)
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
endif(BUILD_16BIT_TARGETS)

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

if(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
add_subdirectory(OK)
add_subdirectory(OLD)
endif(WITH_REDUNDANT_SUBDIRECTORY_TARGETS)
