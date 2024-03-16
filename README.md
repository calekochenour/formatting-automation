[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Formatting Automation

Add git hooks to standardize and format code.

## Project Structure

```
formatting-automation
    .pre-commit-config.yaml
    environment.yml
    LICENSE
    README.md
    setup-windows.bat
```

`.pre-commit-config.yaml`

Provides recipe for the git hooks.

`environment.yml`

Provides recipe for the Conda environment.

`setup-windows.bat`

Automates creation of the Conda environment and setup of the git hooks.

## Environment Setup

The first step is to install Miniconda and clone the GitHub repository.

Install Miniconda:

* Download the latest [Miniconda installer](https://docs.conda.io/en/latest/miniconda.html#latest-miniconda-installer-links) for your operating system
* Follow the Miniconda installation instructions ([Windows](https://conda.io/projects/conda/en/latest/user-guide/install/windows.html), [Linux](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html), [macOS](https://conda.io/projects/conda/en/latest/user-guide/install/macos.html))

Clone GitHub repository:

```commandline
(base) > git clone https://github.com/calekochenour/formatting-automation.git
```

The next step is to set up the git hooks. The `setup-windows.bat` file:
* Creates the Conda environment
* Installs the git hook scripts
* Udpates the repo revisions ('rev') the `.pre-commit-config.yaml` file to the latest stable releases
* Runs the git hooks against all files in the repository

Set up environment:

```commandline
(base) > setup-windows.bat
```

Example output of the setup script. Note that output may differ slightly.

```
Channels:
 - conda-forge
 - defaults
Platform: win-64
Collecting package metadata (repodata.json): done
Solving environment: done

Downloading and Extracting Packages:

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
#
# To activate this environment, use
#
#     $ conda activate formatting-automation
#
# To deactivate an active environment, use
#
#     $ conda deactivate

pre-commit installed at .git\hooks\pre-commit

[https://github.com/pre-commit/pre-commit-hooks] already up to date!
[https://github.com/psf/black] already up to date!

[INFO] Installing environment for https://github.com/psf/black.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
check for added large files..............................................Passed
check yaml...........................................(no files to check)Skipped
fix end of files.........................................................Failed
- hook id: end-of-file-fixer
- exit code: 1
- files were modified by this hook

Fixing README.md

don't commit to branch...................................................Passed
trim trailing whitespace.................................................Failed
- hook id: trailing-whitespace
- exit code: 1
- files were modified by this hook

Fixing README.md

black................................................(no files to check)Skipped
```

Once installed, the git hooks will run every time a user attempts to commit files for this repository As directed by the `.pre-commit-config.yaml` file, the pre-commit routines checks certain files for formatting and modify files as needed to pass the checks. Files that fail the checks will be modified. If any check fails, no files will be committed, but all file modifications from the pre-commit routines will be preserved locally. A user must commit files again will all checks passing in order to push the changes to a remote branch.

## Pre-Commit Resources

Additional resources for pre-commit can be found here:

* https://pre-commit.com
* https://pre-commit.com/hooks.html
* https://github.com/pre-commit/pre-commit
* https://github.com/pre-commit/pre-commit-hooks
* https://github.com/pre-commit/demo-repo

Some useful pre-commit command line references are listed  below.

Install hooks:
```commandline
pre-commit install
```

Run on all files:
```commandline
pre-commit run --all-files
```

Update hook revisions:
```commandline
pre-commit autoupdate
```

Clean cached pre-commit files:
```commandline
pre-commit clean
```

Clean unused cached repos:
```commandline
pre-commit gc
```
