target("test_synchronization")
    set_kind("binary")
    add_files("**/**.cc")
    remove_files("**/lifetime_test.cc")
    add_packages("gtest","benchmark")
    if is_plat("windows") then
        add_ldflags("/subsystem:console")
    end
    add_defines("_DISABLE_EXTENDED_ALIGNED_STORAGE","NOMINMAX")