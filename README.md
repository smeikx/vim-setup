This repo contains my custom vim configuration.


# Initialisation

Running `init.sh` installs all packages from `package-manager/packages.txt`, said file has a CSV-like structure.

`install_packages.sh`, which is run by `init.sh`, clones the respective git repositories in parallel, naming and categorising them according to `packages.txt`. 

The script also applies patches from `package-manager/packages`, using `git am` under the hood. The name of a `*.patch` file has to be identical to its package’s name, as specified in `packages.txt`.  
Patches can be generated using `git format-patch <commit> --stdout > <package-name>.patch`.


# Updating

Packages can be **updated** via `update.sh`, which runs `package-manager/update_packages.sh`. Updating happens in parallel. 


# Adding & Removing Packages

Packages are ignored by git by default. If a package doesn’t have its own separate repository, it is included in this repo by being excluded in the `.gitignore` file. 

