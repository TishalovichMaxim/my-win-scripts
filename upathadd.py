#python3

import os
import sys

if (len(sys.argv) != 2):
    print(f"Use: {sys.argv[0].split("\\")[-1]} *path*")
    sys.exit()

path_value = "$env:path" + f" + ';{sys.argv[1]}'"

os.system(f"powershell [Environment]::SetEnvironmentVariable('PATH', {path_value}, 'User')")

