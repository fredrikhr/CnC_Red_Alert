file_glob_enabled_languages_source_files()

add_executable(CWSTUB CWSTUB.C)
target_compile_definitions(CWSTUB
  PRIVATE
    QUIET
    VMM
)
list(REMOVE_ITEM PROJECT_ANY_LANG_SOURCE_FILES CWSTUB.C)
list(REMOVE_ITEM PROJECT_C_SOURCE_FILES CWSTUB.C)

add_executable(RA95 WIN32)
target_compile_definitions(RA95
  PRIVATE
    WINSOCK_IPX
)
target_sources(RA95 PRIVATE ${PROJECT_ANY_LANG_SOURCE_FILES})
target_sources(RA95
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)
target_precompile_headers(RA95 PRIVATE CONQUER.H)
