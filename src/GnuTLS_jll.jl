# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule GnuTLS_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("GnuTLS")
JLLWrappers.@generate_main_file("GnuTLS", UUID("0951126a-58fd-58f1-b5b3-b08c7c4a876d"))
end  # module GnuTLS_jll
