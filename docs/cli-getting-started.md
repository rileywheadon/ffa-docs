# Getting Started

To begin, install the CLI by following the [installation instructions](cli-installation-instructions.md).

The FFA Framework CLI is a single script: `ffaframework.R`.
It performs exploratory data analysis and/or flood frequency analysis (FFA) on one or more datasets.
It can also generate reports in Markdown, PDF, HTML, or JSON formats.

Configuration is handled through the `config.yml` file.
For more information, see the [user manual](cli-user-manual.md).

## Folder Structure

The **`/data`** folder contains input CSV files for the CLI.
The following files are included by default:

- `Application_1.csv`: Station 07BE001 (Athabasca River at Athabasca)
- `Application_2.csv`: Station 08NH021 (Kootenai River at Porthill)
- `Application_3_1.csv`: Station 05BB001 (Bow River at Banff)
- `Application_3_2.csv`: Station 08MH016 (Chilliwack River at Chilliwack Lake)
- `Application_3_3.csv`: Station 08NM050 (Okanagan River at Penticton)
- `Application_4.csv`: Station 05BA001 (Bow River at Lake Louise)
- `Application_5.csv`: Station 08NM116 (Mission Creek near East Kelowna)

The **`/reports`** folder stores output reports and figures generated by the CLI.

## Trying it out!

To test the framework, navigate to the `ffa-framework` folder in your terminal and run the command `Rscript ffaframework.R`.
By default, the CLI uses the dataset `Application_1.csv`.

## What Next?

We recommend exploring the "Exploratory Data Analysis" and "Flood Frequency Analysis" sections in the sidebar to gain a better understanding of the statistical methods used in the framework.
Once you're familiar with the framework, try running an analysis on another example dataset!
