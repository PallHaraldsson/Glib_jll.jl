# Autogenerated wrapper script for Glib_jll for powerpc64le-linux-gnu
export libglib

using Libffi_jll
using Gettext_jll
using PCRE_jll
using Zlib_jll
## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libglib`
const libglib_splitpath = ["lib", "libglib-2.0.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libglib_path = ""

# libglib-specific global declaration
# This will be filled out by __init__()
libglib_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libglib = "libglib-2.0.so.0"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    append!(PATH_list, Libffi_jll.PATH_list)
    append!(LIBPATH_list, Libffi_jll.LIBPATH_list)
    append!(PATH_list, Gettext_jll.PATH_list)
    append!(LIBPATH_list, Gettext_jll.LIBPATH_list)
    append!(PATH_list, PCRE_jll.PATH_list)
    append!(LIBPATH_list, PCRE_jll.LIBPATH_list)
    append!(PATH_list, Zlib_jll.PATH_list)
    append!(LIBPATH_list, Zlib_jll.LIBPATH_list)
    global libglib_path = abspath(joinpath(artifact"Glib", libglib_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libglib_handle = dlopen(libglib_path)
    push!(LIBPATH_list, dirname(libglib_path))

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

