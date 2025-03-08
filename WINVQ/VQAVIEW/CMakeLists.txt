include(project_component_helpers)
set_project_component_name()
project_component(EXECUTABLE)

target_include_directories(${PROJECT_COMPONENT_NAME}
  PUBLIC
  "${CMAKE_CURRENT_SOURCE_DIR}/../INCLUDE"
  "${CMAKE_CURRENT_SOURCE_DIR}/../INCLUDE/VQM32"
)
set_source_files_properties(
  ${PROJECT_COMPONENT_ASM_MASM_SOURCE_FILES}
  PROPERTIES COMPILE_DEFINITIONS "PHARLAP_TNT=0"
)
