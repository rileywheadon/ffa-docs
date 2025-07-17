#  Installing the `ffaframework` Package

1. Open a shell (terminal) and navigate to the directory where you want to install the package.
2. Clone the Github repository by running the following command in a shell:

        git clone https://github.com/rileywheadon/ffa-package.git

3. Open a command prompt with `R`. Install and load the `devtools` package (if not already installed): 

        install.packages("devtools")
        library(devtools)

4. Install the package by specifying the correct path: 

        devtools::install("~/path/to/ffa-package")
   
   Replace `~/path/to/ffa-package` with the actual path to the cloned directory.
   
6. Exit the command prompt with `q()`. The package is now installed and ready to use.


