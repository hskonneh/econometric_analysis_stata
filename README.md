# 📊 Econometric Analysis with Stata 📈

![Stata](https://img.shields.io/badge/Stata-17-blue) ![License](https://img.shields.io/badge/License-MIT-green)

A comprehensive project demonstrating econometric analysis using Stata. This repository includes data cleaning, preparation, and time series analysis of health and economic data.

---

## 📜 Table of Contents

- [About the Project](#-about-the-project)
- [🚀 Getting Started](#-getting-started)
  - [Prerequisites](#-prerequisites)
  - [Installation](#-installation)
- [📂 Folder Structure](#-folder-structure)
- [📖 Usage](#-usage)
- [💾 Data](#-data)
- [🔬 Methodology](#-methodology)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [🙏 Acknowledgments](#-acknowledgments)

---

## 🌟 About the Project

This project provides a detailed example of an econometric study using Stata. It focuses on the relationship between health and economic indicators over time. The entire workflow, from data importation to analysis, is documented in the Stata do-file.

---

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### ✅ Prerequisites

You will need Stata installed on your machine to run the analysis.

- [Stata](https://www.stata.com/)

### 💻 Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your_username/econometric_analysis_stata.git
    ```
2.  Open the `econs.do` file in Stata.

---

## 📂 Folder Structure

The project is organized as follows:

```
econometric_analysis_stata/
├── .git/
├── added_file.dta
├── econs.do
├── econs.dta
├── econs.smcl
├── LICENSE
└── README.md
```

- **`econs.do`**: The main Stata script for the analysis. 👨‍💻
- **`econs.dta`**: The primary dataset used in the analysis. 📊
- **`added_file.dta`**: Additional data file. 📄
- **`econs.smcl`**: Stata log file with the output of the analysis. 📝
- **`LICENSE`**: MIT License for the project. 📜
- **`README.md`**: This file. 😊

---

## 📖 Usage

To replicate the analysis, simply run the `econs.do` file in Stata. The script will:

1.  Import the data.
2.  Clean and prepare the variables.
3.  Perform time series analysis.
4.  Generate graphs and test for unit roots.
5.  Save the cleaned dataset.

---

## 💾 Data

The dataset contains time series data on the following variables:

- **`year`**: Fiscal Year
- **`gdpin`**: GDP in Leones
- **`gdppercapita`**: GDP per Capita (USD)
- **`gee_pof_gdpdf`**: Government Education Expenditure (% of GDP)
- **`LFPat_rate`**: Labor Force Participation Rate
- **`ghe_pof_gdp`**: Government Health Expenditure (% of GDP)

---

## 🔬 Methodology

The analysis in this project includes the following econometric techniques:

- **Data Cleaning and Preparation**: Renaming, labeling, and formatting variables.
- **Time Series Analysis**:
  - Setting the time variable.
  - Generating time series plots.
- **Unit Root Tests**:
  - Dickey-Fuller GLS
  - Augmented Dickey-Fuller
  - Phillips-Perron

---

## 🤝 Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 🙏 Acknowledgments

- Hat tip to anyone who wants to contribute in this repository.
