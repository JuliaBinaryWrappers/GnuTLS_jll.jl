# Autogenerated wrapper script for GnuTLS_jll for aarch64-linux-musl
export libgnutls

using Zlib_jll
using GMP_jll
using Nettle_jll
JLLWrappers.@generate_wrapper_header("GnuTLS")
JLLWrappers.@declare_library_product(libgnutls, "libgnutls.so.30")
function __init__()
    JLLWrappers.@generate_init_header(Zlib_jll, GMP_jll, Nettle_jll)
    JLLWrappers.@init_library_product(
        libgnutls,
        "lib/libgnutls.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
