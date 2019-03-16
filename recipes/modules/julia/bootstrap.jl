VERSION >= v"0.7" && import Pkg

ENV["PYTHON"] = "python3"
ENV["JUPYTER"] = "jupyter"

Pkg.add("PyCall")
Pkg.add("Plots")
Pkg.add("GR")
Pkg.add("IJulia")
