# Installing the `ffaframework` Package

## Prerequisites

1. **Install Git**: [https://git-scm.com/downloads](https://git-scm.com/downloads). 
2. **Install R** (v4.5.1 recommended): [https://www.r-project.org/](https://www.r-project.org/).
3. **Install Pandoc** (for report generation): [https://pandoc.org/](https://pandoc.org/).

Verify that the installations were successful by executing the following commands in a terminal:

1. `git --version`
2. `R --version`
3. `pandoc --version`

### Note for Windows Users

You may need to add Git, R and Pandoc to your `PATH` to run them from the command line.
The default paths for Git, R and Pandoc are:

```
C:\Program Files\Git\bin
C:\Program Files\R\R-4.5.0\bin
C:\Program Files\Pandoc
```
To update your `PATH`, edit your system environment variables from the settings menu.

## Instructions

1. Open a terminal and navigate to the directory where you want to install the package.
2. Clone the Github repository by running the following command:

        git clone https://github.com/rileywheadon/ffa-package.git

3. Open the R console. Then install and load the `devtools` package (if not already installed): 

        install.packages("devtools")
        library(devtools)

4. Install the `ffaframework` package: 

        devtools::install("~/path/to/ffa-package")
   
    Replace `~/path/to/ffa-package` with the path to the cloned directory from step 2.
   
5. Exit the R console with `q()`. The `ffaframework` package is now installed and ready to use.


