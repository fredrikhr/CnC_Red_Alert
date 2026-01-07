add_library(WIN32LIB STATIC)
target_include_directories(WIN32LIB
  PUBLIC
    "INCLUDE"
)
file_glob_enabled_language_files_in_directory(WIN32LIB_INCLUDE INCLUDE)
list(TRANSFORM PROJECT_WIN32LIB_INCLUDE_ANY_LANG_IGNORES
  PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/INCLUDE/"
)

add_subdirectory(AUDIO)
add_subdirectory(DIPTHONG)
add_subdirectory(DRAWBUFF)
add_subdirectory(FONT)
add_subdirectory(IFF)
add_subdirectory(KEYBOARD)
add_subdirectory(MEM)
add_subdirectory(MISC)
add_subdirectory(MONO)
add_subdirectory(PALETTE)
add_subdirectory(SHAPE)
add_subdirectory(TILE)
add_subdirectory(TIMER)
add_subdirectory(WW_WIN)
add_subdirectory(WSA)
add_subdirectory(PROFILE)
add_subdirectory(PLAYCD)
add_subdirectory(WINCOMM)
add_subdirectory(SRCDEBUG)
add_subdirectory(EXAMPLE)
