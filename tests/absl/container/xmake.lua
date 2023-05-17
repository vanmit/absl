target("test_container")
    set_kind("binary")
    add_files("**/**.cc")
    remove_files("**/failure_signal_handler_test.cc")
    add_packages("gtest","benchmark")
    if is_plat("windows") then
        add_ldflags("/subsystem:console")
    end
