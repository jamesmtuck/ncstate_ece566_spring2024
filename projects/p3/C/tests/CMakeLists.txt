find_file(LLVM_DIS llvm-dis-17 NAMES llvm-dis)
find_file(FILECHECK FileCheck-17 NAMES FileCheck)

function(p3_test_nocse name class)
    add_custom_target(${name}-nocse.bc ALL
            p3 -verbose -no-cse ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-nocse.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
            )
    add_custom_target(${name}-nocse.ll ALL
            ${LLVM_DIS} ${name}-nocse.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${name}-nocse.bc
            )
    add_test(NAME Fail-${class}-${name} COMMAND ${FILECHECK} --input-file=${CMAKE_CURRENT_BINARY_DIR}/${name}-nocse.ll ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll )
    set_tests_properties(Fail-${class}-${name} PROPERTIES WILL_FAIL TRUE)
endfunction(p3_test_nocse)

function(p3_test name class)
    add_custom_target(${name}-out.bc ALL
            p3 -verbose ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
    )
    add_custom_target(${name}-out.ll ALL
            ${LLVM_DIS} ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${name}-out.bc
    )
    add_test(NAME ${class}-${name} COMMAND ${FILECHECK} --input-file=${CMAKE_CURRENT_BINARY_DIR}/${name}-out.ll ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll )
endfunction(p3_test)

function(p3_notest name class)
    add_custom_target(${name}-out.bc ALL
            p3 -verbose ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
    )
    add_custom_target(${name}-out.ll ALL
            ${LLVM_DIS} ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p3 ${name}-out.bc
    )
endfunction(p3_notest)

p3_notest(adpcm cse)
p3_notest(arm cse)
p3_notest(basicmath cse)
p3_notest(bh cse)
p3_notest(bitcount cse)
p3_notest(crc32 cse)
p3_notest(dijkstra cse)
p3_notest(em3d cse)
p3_notest(fft cse)
p3_notest(hello cse)
p3_notest(kmp cse)
p3_notest(l2lat cse)
p3_notest(patricia cse)
p3_notest(qsort cse)
p3_notest(sha cse)
p3_notest(smatrix cse)
p3_notest(sql cse)
p3_notest(susan cse)
