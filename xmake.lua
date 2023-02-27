add_rules("mode.debug", "mode.release")
--add_rules("mode.release")
-- add toolchains
includes("toolchains/*.lua")

DEVICE = ' -march=rv32imac -mabi=ilp32 -DUSE_PLIC -DUSE_M_TIME -DNO_INIT -mcmodel=medany -msmall-data-limit=8 -L.  -nostartfiles  -lc '
--set target
target("mlibc")
    -- set target file type
    set_kind("static")
    --strip all infomation
    set_strip("all")
    --set default target
    set_default(true)
    -- set target dir
    set_targetdir("./")
    --set target filename
    set_filename("mlibc.a")
    --set optimize O1
    set_optimize("fast")
    --set languages standard
    set_languages("c99", "cxx11")
    -- set compiler cflags for device
    add_cflags(DEVICE, {force = true})
    -- set compiler cflags for no standard library
    add_cflags("-nostdlib","-ffreestanding", {force = true})
    -- add all files
    add_files("src/*.c")
    -- add headfile dir
    add_includedirs("include",{public = true})
    -- set_toolchains("riscv64-unknown-elf")
    set_toolchains("riscv-none-embed")
target_end() 
    
--
-- If you want to known more usage about xmake, please see https://xmake.io
--
-- ## FAQ
--
-- You can enter the project directory firstly before building project.
--
--   $ cd projectdir
--
-- 1. How to build project?
--
--   $ xmake
--
-- 2. How to configure project?
--
--   $ xmake f -p [macosx|linux|iphoneos ..] -a [x86_64|i386|arm64 ..] -m [debug|release]
--
-- 3. Where is the build output directory?
--
--   The default output directory is `./build` and you can configure the output directory.
--
--   $ xmake f -o outputdir
--   $ xmake
--
-- 4. How to run and debug target after building project?
--
--   $ xmake run [targetname]
--   $ xmake run -d [targetname]
--
-- 5. How to install target to the system directory or other output directory?
--
--   $ xmake install
--   $ xmake install -o installdir
--
-- 6. Add some frequently-used compilation flags in xmake.lua
--
-- @code
--    -- add debug and release modes
--    add_rules("mode.debug", "mode.release")
--
--    -- add macro defination
--    add_defines("NDEBUG", "_GNU_SOURCE=1")
--
--    -- set warning all as error
--    set_warnings("all", "error")
--
--    -- set language: c99, c++11
--    set_languages("c99", "c++11")
--
--    -- set optimization: none, faster, fastest, smallest
--    set_optimize("fastest")
--
--    -- add include search directories
--    add_includedirs("/usr/include", "/usr/local/include")
--
--    -- add link libraries and search directories
--    add_links("tbox")
--    add_linkdirs("/usr/local/lib", "/usr/lib")
--
--    -- add system link libraries
--    add_syslinks("z", "pthread")
--
--    -- add compilation and link flags
--    add_cxflags("-stdnolib", "-fno-strict-aliasing")
--    add_ldflags("-L/usr/local/lib", "-lpthread", {force = true})
--
-- @endcode
--
