<p align="center">
  <a href="./somelink">
    <img src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/logo.png" alt="Artemis" width="150" height="150">
  </a>
</p>

# ARTEMIS

**ARTEMIS** (Advanced Regression and Tree Estimation Model for Integrated Silviology) is an advanced Python package designed for forestry statistics, bringing innovation to the field through the incorporation of the Chapman-Richards growth function and state-of-the-art optimization techniques. ARTEMIS offers a suite of tools for estimating tree and forest growth variables, and it particularly excels in handling forestry data characterized by noise and spurious outliers.

Developed by **FixedPoint IO Ltd** for **Climate Impact Partners**.

## Features

- **Chapman-Richards Growth Function**: Estimate tree and forest growth variables with high precision.
- **Data Cleaning**: Specialized scripts to process and clean forestry data.
- **Innovative Optimization**: Utilizes Nevergrad, a cutting-edge optimization library, to robustly fit growth model parameters to noisy forestry data.

<p align="center">
  <a href="./somelink">
    <img src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/3d.png" alt="Artemis" width="350" height="350">
  </a>
</p>

## Incorporating Priors for Parameter Ranges

ARTEMIS offers a unique and powerful feature that allows users to incorporate prior information, or "priors," into the optimization process for parameter ranges. Priors are particularly useful when there is strong academic evidence or ground truth about certain parameter values, allowing you to guide the optimization process toward values that align with existing knowledge. This feature is especially valuable in forestry statistics, where noisy and spurious outlier-prone data is common.

To use priors with ARTEMIS, you can specify the desired ranges for each parameter along with your prior knowledge range. The optimization process will then be influenced by these priors, helping you obtain more meaningful and accurate parameter estimates. Priors can be applied to parameters such as tree growth rates (A), decay constants (k), and shape parameters (p), enabling you to harness both domain expertise and statistical optimization for robust results.

## Installation

To harness the innovative capabilities of ARTEMIS:

- Clone or download this repository.
- Open the Jupyter workbook and explore the features directly.

## License & Copyright

This software is proprietary and owned by Climate Impact Partners. Developed by FixedPoint IO Ltd.

Refer to the software license agreement for more details on usage restrictions and permissions.

## Contact

For technical questions and support, contact:

Charles
Email: charles@fixedpoint.io

The demo dataset comes from U.S. Department of Agriculture, Forest Service, Pacific Southwest Research Station:

McPherson, E. Gregory; van Doorn, Natalie S.; Peper, Paula J. 2016. Urban tree database. Fort Collins, CO: Forest Service Research Data Archive. Updated 21 January 2020. https://doi.org/10.2737/RDS-2016-0005
