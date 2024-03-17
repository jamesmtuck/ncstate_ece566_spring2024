find_file(LLVM_DIS llvm-dis-17 NAMES llvm-dis)
find_file(FILECHECK FileCheck-17 NAMES FileCheck)

function(p2_test_nocse name class)
    add_custom_target(${name}-nocse.bc ALL
            p2 -verbose -no-cse ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-nocse.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
            )
    add_custom_target(${name}-nocse.ll ALL
            ${LLVM_DIS} ${name}-nocse.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${name}-nocse.bc
            )
    add_test(NAME Fail-${class}-${name} COMMAND ${FILECHECK} --input-file=${CMAKE_CURRENT_BINARY_DIR}/${name}-nocse.ll ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll )
    set_tests_properties(Fail-${class}-${name} PROPERTIES WILL_FAIL TRUE)
endfunction(p2_test_nocse)

function(p2_test name class)
    add_custom_target(${name}-out.bc ALL
            p2 -verbose ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
    )
    add_custom_target(${name}-out.ll ALL
            ${LLVM_DIS} ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${name}-out.bc
    )
    add_test(NAME ${class}-${name} COMMAND ${FILECHECK} --input-file=${CMAKE_CURRENT_BINARY_DIR}/${name}-out.ll ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll )
endfunction(p2_test)

function(p2_notest name class)
    add_custom_target(${name}-out.bc ALL
            p2 -verbose ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${CMAKE_CURRENT_SOURCE_DIR}/${name}.ll
    )
    add_custom_target(${name}-out.ll ALL
            ${LLVM_DIS} ${name}-out.bc
            WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            DEPENDS p2 ${name}-out.bc
    )
endfunction(p2_notest)

p2_test(cse0 CSEDead)
p2_test(cse1 CSEElim)
p2_test(cse2 CSESimplify)
p2_test(cse3 CSELdElim)
p2_test(cse4 CSEStore2Load)
p2_test(cse5 CSEStElim)
p2_test(cse6 Other)

p2_test_nocse(cse0 CSEDead)
p2_test_nocse(cse1 CSEElim)
p2_test_nocse(cse2 CSESimplify)
p2_test_nocse(cse3 CSELdElim)
p2_test_nocse(cse4 CSEStore2Load)
p2_test_nocse(cse5 CSEStElim)
p2_test_nocse(cse6 Other)


p2_notest(adpcm cse)
p2_notest(arm cse)
p2_notest(basicmath cse)
p2_notest(bh cse)
p2_notest(bitcount cse)
p2_notest(crc32 cse)
p2_notest(dijkstra cse)
p2_notest(em3d cse)
p2_notest(fft cse)
p2_notest(hello cse)
p2_notest(kmp cse)
p2_notest(l2lat cse)
p2_notest(patricia cse)
p2_notest(qsort cse)
p2_notest(sha cse)
p2_notest(smatrix cse)
p2_notest(sql cse)
p2_notest(susan cse)
