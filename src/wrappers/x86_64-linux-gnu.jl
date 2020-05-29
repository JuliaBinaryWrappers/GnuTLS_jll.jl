# Autogenerated wrapper script for GnuTLS_jll for x86_64-linux-gnu
export libgnutls

using Zlib_jll
using GMP_jll
using Nettle_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libgnutls`
const libgnutls_splitpath = ["lib", "libgnutls.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgnutls_path = ""

# libgnutls-specific global declaration
# This will be filled out by __init__()
libgnutls_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgnutls = "libgnutls.so.30"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"GnuTLS")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Zlib_jll.PATH_list, GMP_jll.PATH_list, Nettle_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Zlib_jll.LIBPATH_list, GMP_jll.LIBPATH_list, Nettle_jll.LIBPATH_list,))

    global libgnutls_path = normpath(joinpath(artifact_dir, libgnutls_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgnutls_handle = dlopen(libgnutls_path)
    push!(LIBPATH_list, dirname(libgnutls_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

