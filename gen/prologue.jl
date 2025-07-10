@static if Sys.islinux()
    const libgclibo = "libgclibo.so"
elseif Sys.iswindows()
    const libgclibo = "gclibo.dll"
else
    error("Unsupported OS")
end