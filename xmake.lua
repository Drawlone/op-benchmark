add_rules("mode.debug", "mode.release")
add_includedirs("include")

toolchain("arm_toolchain")
    set_kind("standalone")
    set_sdkdir("/usr/local/arm/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf")
toolchain_end()
set_toolchains("arm_toolchain")
set_optimize("fast")
target("miracl")
    set_kind("static")
    add_files("src/mrcore.c")
    add_files("src/mrarth0.c")
    add_files("src/mrarth1.c")
    add_files("src/mrarth2.c")
    add_files("src/mralloc.c")
    add_files("src/mrsmall.c")
    add_files("src/mrio1.c")
    add_files("src/mrio2.c")
    add_files("src/mrgcd.c")
    add_files("src/mrjack.c")
    add_files("src/mrxgcd.c")
    add_files("src/mrarth3.c")
    add_files("src/mrbits.c")
    add_files("src/mrrand.c")
    add_files("src/mrprime.c")
    add_files("src/mrcrt.c")
    add_files("src/mrscrt.c")
    add_files("src/mrmonty.c")
    add_files("src/mrpower.c")
    add_files("src/mrsroot.c")
    add_files("src/mrcurve.c")
    add_files("src/mrfast.c")
    add_files("src/mrshs.c")
    add_files("src/mrshs256.c")
    add_files("src/mrshs512.c")
    add_files("src/mrsha3.c")
    add_files("src/mrfpe.c")
    add_files("src/mraes.c")
    add_files("src/mrgcm.c")
    add_files("src/mrlucas.c")
    add_files("src/mrzzn2.c")
    add_files("src/mrzzn2b.c")
    add_files("src/mrzzn3.c")
    add_files("src/mrzzn4.c")
    add_files("src/mrecn2.c")
    add_files("src/mrstrong.c")
    add_files("src/mrbrick.c")
    add_files("src/mrebrick.c")
    add_files("src/mrec2m.c")
    add_files("src/mrgf2m.c")
    add_files("src/mrflash.c")
    add_files("src/mrfrnd.c")
    add_files("src/mrdouble.c")
    add_files("src/mrround.c")
    add_files("src/mrbuild.c")
    add_files("src/mrflsh1.c")
    add_files("src/mrpi.c")
    add_files("src/mrflsh2.c")
    add_files("src/mrflsh3.c")
    add_files("src/mrflsh4.c")
    add_files("src/mrmuldv.c")
    add_files("src/big.cpp")
    add_files("src/zzn.cpp")
    add_files("src/ecn.cpp")
    add_files("src/ec2.cpp")
    add_files("src/flash.cpp")
    add_files("src/crt.cpp")

target("test")
    set_kind("binary")
    add_files("test/bmark.c")
    add_deps("miracl")

target("op-ecc")
    set_kind("binary")
    add_files("test/op-ecc.cpp")
    add_deps("miracl")

target("op-pairing")
    set_kind("binary")
    add_files("test/op-pairing.cpp", "test/ssp_pair.cpp", "test/zzn2.cpp")
    add_deps("miracl")




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

