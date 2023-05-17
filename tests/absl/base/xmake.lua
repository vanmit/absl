target("test_base")
    set_kind("binary")
    add_files("**/**.cc")
    remove_files("**/low_level_alloc_test.cc","**/cmake_thread_test.cc")
    add_packages("gtest","benchmark")
    if is_plat("windows") then
        add_ldflags("/subsystem:console")
    end
    add_defines("_DISABLE_EXTENDED_ALIGNED_STORAGE","NOMINMAX")