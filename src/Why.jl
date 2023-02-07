module Why

# Fetch packages.
using Random

# Run files.
include("why.jl")
include("how.jl")

# Export functions.
export why, how

end # module
