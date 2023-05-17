target("test_random")
    set_kind("binary")
    add_files("**/**.cc")
    remove_files("**/nanobenchmark_test.cc","**/randen_benchmarks.cc","**/randen_hwaes_test.cc")
    add_packages("gtest","benchmark")
    if is_plat("windows") then
        add_ldflags("/subsystem:console")
    end
    add_defines("_DISABLE_EXTENDED_ALIGNED_STORAGE","NOMINMAX")