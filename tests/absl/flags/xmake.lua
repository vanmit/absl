target("test_flags")
    set_kind("binary")
    add_files("**/**.cc")
    add_packages("gtest","benchmark")
    remove_files("**/usage_test.cc")
    if is_plat("windows") then
        add_ldflags("/subsystem:console")
    end
    add_defines("_DISABLE_EXTENDED_ALIGNED_STORAGE","NOMINMAX")