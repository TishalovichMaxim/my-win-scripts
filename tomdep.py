#python3

import os
import sys
import shutil

if (len(sys.argv) != 2):
    print(f"Use: {sys.argv[0].split("\\")[-1]} *project path*")
    sys.exit()

project_path = sys.argv[1]

dirs = os.listdir(project_path)

if not 'target' in dirs:
    print(f"Target directory not found")
    sys.exit()

target_dir = os.path.join(project_path, 'target')

war_files = [file for file in os.listdir(target_dir) if file.endswith('.war')]

if len(war_files) == 0:
    print(f"There is no .war file in target directory.")
    sys.exit()

if len(war_files) > 1:
    print(f"There are several .war files in target directory.")
    sys.exit()

war_file = os.path.join(target_dir, war_files[0])

deploy_dir = os.path.join(os.getenv('CATALINA_BASE'), 'webapps')

shutil.copy(war_file, deploy_dir)

