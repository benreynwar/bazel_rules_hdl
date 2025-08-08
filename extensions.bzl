# Module extensions for bazel_rules_hdl

# Load all the dependencies to avoid adding them one by one
load("//dependency_support:dependency_support.bzl", "dependency_support")

def _hdl_deps_extension_impl(module_ctx):
    # Use their full dependency_support function which includes everything
    dependency_support(register_toolchains = False)  # We register toolchains in MODULE.bazel
    
    # Return the repositories that should be available to users
    # For git-based cocotb dependency, the repository name will be rules_hdl_pip_deps_vendored_cocotb
    return module_ctx.extension_metadata(
        reproducible = True,
    )

hdl_deps_extension = module_extension(
    implementation = _hdl_deps_extension_impl,
)
