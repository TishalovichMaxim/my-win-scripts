#python3

import os
import sys

if (len(sys.argv) != 3):
    print(f"Use: {sys.argv[0].split("\\")[-1]} *env_var_name* *env_var_value*")
    sys.exit()

os.system(f"powershell [Environment]::SetEnvironmentVariable('{sys.argv[1]}', '{sys.argv[2]}', 'User')")

