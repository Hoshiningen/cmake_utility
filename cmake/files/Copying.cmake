# This requires CMake 3.21.0
function(CopyRuntimeDLLsPostBuild TARGET)
    add_custom_command(
        TARGET ${TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_RUNTIME_DLLS:${TARGET}> $<TARGET_FILE_DIR:${TARGET}>
        COMMAND_EXPAND_LISTS)
endfunction()

function(CopyDLLPostBuild DLL_TARGET EXE_TARGET)
    add_custom_command(
        TARGET ${EXE_TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${DLL_TARGET}> $<TARGET_FILE_DIR:${EXE_TARGET}>)
endfunction()

function(CopyDirectoryPostBuild TARGET SOURCE DEST)
    add_custom_command(
        TARGET ${TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${SOURCE} ${DEST})
endfunction()