#  Installing the `ffaframework` Package

1. Open a shell and navigate to the directory where you would like to install the package.
2. Clone the Github repository by running the following command in a shell:

        git clone https://github.com/rileywheadon/ffa-package.git

3. Open a command prompt with `R`. Install the `devtools` package: 

        install.packages("devtools")
        library(devtools)

4. Run the following command, changing `~/path/to/ffa-package` as needed. 

        devtools::install("~/path/to/ffa-package")

5. Exit the command prompt with `q()`. The installation is complete.


