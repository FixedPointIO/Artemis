<p align="center">
  <a href="https://github.com/fixedpointexperimental/Artemis">
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
  <a href="(https://github.com/fixedpointexperimental/Artemis)">
    <img src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/3d.png" alt="Artemis" width="450" height="450">
  </a>
</p>

## Incorporating Priors for Parameter Ranges

ARTEMIS offers a unique and powerful feature that allows users to incorporate prior information, or "priors," into the optimization process for parameter ranges. Priors are particularly useful when there is strong academic evidence or ground truth about certain parameter values, allowing you to guide the optimization process toward values that align with existing knowledge. This feature is especially valuable in forestry statistics, where noisy and spurious outlier-prone data is common.

To use priors with ARTEMIS, you can specify the desired ranges for each parameter along with your prior knowledge range. The optimization process will then be influenced by these priors, helping you obtain more meaningful and accurate parameter estimates. Priors can be applied to parameters such as tree growth rates (A), decay constants (k), and shape parameters (p), enabling you to harness both domain expertise and statistical optimization for robust results.

## Installation

To harness the innovative capabilities of ARTEMIS:

- Clone or download this repository.
- Open the Jupyter workbook and explore the features directly.

## Intelligent optimization

In the landscape of automatic optimization, challenges emerge from the diverse requirements of real-world problems. These requirements range from the intricacies of problem models to the computational resources at hand. Addressing these challenges requires algorithm selection wizards—tools that are versatile, robust, and adept at selecting the most effective algorithm for a specific problem instance.

The creation of a competitive algorithm selection wizard is a daunting task. It necessitates not only defining the rules for algorithm selection but also configuring the parameters of the selectable algorithms—a challenge in its own right. While automated wizards have been crafted for specific domains like SAT problems, many algorithm selection tools, especially those designed for broader applications, are hand-crafted. 

Among these, NGOpt stands out as a paragon of hand-crafted excellence. Integrated within the Nevergrad optimization platform, NGOpt is a product of meticulous research and iterative refinement. Its design was informed by a thorough evaluation of the performance of numerous optimizers across diverse benchmark suites. Based on these insights, hand-crafted rules were devised to strategically select the best optimizer tailored to specific problem features.

The evolution of NGOpt involved iterative enhancements. Over time, certain rules were refined, and specific optimizers were replaced to enhance performance. This rigorous and iterative process birthed a sophisticated algorithm selection wizard. The resultant NGOpt not only embodies the complexity of its design process but also showcases superior performance. When pitted against renowned standalone optimizers across various benchmark suites, NGOpt consistently emerges as a top performer.

For ARTEMIS, the integration of NGOpt means access to a tool that is not just versatile but also empirically validated. By leveraging NGOpt's capabilities, ARTEMIS ensures that its optimization processes are always aligned with the best available strategies, guaranteeing optimal outcomes across diverse forestry challenges. 

## Contact

For technical questions and support, contact:

Charles
Email: charles@fixedpoint.io

The demo dataset comes from U.S. Department of Agriculture, Forest Service, Pacific Southwest Research Station:

McPherson, E. Gregory; van Doorn, Natalie S.; Peper, Paula J. 2016. Urban tree database. Fort Collins, CO: Forest Service Research Data Archive. Updated 21 January 2020. https://doi.org/10.2737/RDS-2016-0005
