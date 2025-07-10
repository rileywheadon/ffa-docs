# Installing the CLI

## Prerequisites

1. Install Git from [https://git-scm.com/downloads](https://git-scm.com/downloads). 
2. Check that Git is installed by executing `git --version` in a shell.
3. Install R from [https://www.r-project.org/](https://www.r-project.org/). Version 4.5.0 is recommended.
4. Check that R is installed by executing `R --version` in  a shell.  
5. Install the latest version of Pandoc from [https://pandoc.org/](https://pandoc.org/).
6. Check that Pandoc is installed by executing `pandoc --version` in a shell.

### A Note for Windows Users

You may need to add Git, R and Pandoc to your path in order to run them from the command line.
To do this, you will need to edit your system environment variables from the settings menu.
The default paths for Git, R and Pandoc are:

```
C:\Program Files\Git\bin
C:\Program Files\R\R-4.5.0\bin
C:\Program Files\Pandoc
```

## Instructions

1. Open a shell and navigate to the directory where you would like to install the framework.
2. Clone the Github repository by running the following command in a shell:

        git clone https://github.com/rileywheadon/ffa-framework.git

3. Navigate to the `source` directory. This directory contains a `renv.lock` file.
4. Open a command prompt with `R`. The `renv` package should install automatically.
5. Load libraries from the `renv.lock` file by executing `renv::restore()`.
6. Exit the command prompt with `q()`.

You will also need to install the [R package](https://github.com/rileywheadon/ffa-package).
See [here](r-installation-instructions.md) for installation instructions.


---

This guide has been tested on Linux, Windows, and MacOS. 

Please submit a [Github Issue](https://github.com/rileywheadon/ffa-framework/issues) if you have any problems.

