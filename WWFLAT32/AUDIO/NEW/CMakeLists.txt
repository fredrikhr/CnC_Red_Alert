file_glob_enabled_languages_source_files()

add_library(WWFLAT32_AUDIO_NEW OBJECT)
target_sources(WWFLAT32_AUDIO_NEW
  PRIVATE
    ${PROJECT_ANY_LANG_SOURCE_FILES}
)
target_sources(WWFLAT32_AUDIO_NEW
  PRIVATE
    FILE_SET HEADERS
    FILES ${PROJECT_ANY_LANG_IGNORES}
)

set_asm_masm_source_files_language_property()
