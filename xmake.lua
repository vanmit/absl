set_project("absl")

set_languages("c99","cxx11")

add_rules("mode.debug","mode.release", "mode.minsizerel")

add_includedirs(".")

target("absl")
    set_kind("static")
    add_defines("NOMINMAX")
    add_files("absl/**.cc")
    if is_kind("shared") then 
        add_defines("ABSL_BUILD_DLL")
    end
    after_build(function (target)
        -- https://www.bookstack.cn/read/xmake/manual-builtin_modules.md
        os.tryrm("build/include")
        os.cp("absl/**.h", "build/include/", {rootdir = "absl"})
    end)


includes("tests")

