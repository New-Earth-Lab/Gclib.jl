@static if Sys.islinux()
    const libgclibo = "libgclib.so"
elseif Sys.iswindows()
    const libgclibo = "gclib.dll"
else
    error("Unsupported OS")
end