# ARTEMIS

**ARTEMIS** (Advanced Regression and Tree Estimation Model for Integrated Silviology) is a Python package developed for research and applications in forestry statistics. This tool utilises modern optimisation techniques to derive the Chapman-Richards growth function, addressing the challenges presented by forestry data that may contain noise or outliers. [Read the wiki](https://github.com/FixedPointIO/Artemis/wiki)!

## Features

- **Growth Function through Evolutionary Optimisation**: ARTEMIS employs evolutionary algorithms to optimise the parameters of the Chapman-Richards function, aiming for an accurate representation of tree and forest growth metrics.
- **Data Refinement**: Contains scripts for the thorough processing and refinement of forestry datasets.
- **Optimisation Techniques**: Incorporates Nevergrad, an advanced optimisation library, to refine growth model parameters, particularly in the presence of noisy data.
- **Prior Knowledge Integration**: ARTEMIS facilitates the inclusion of prior information, sourced from academic literature or other authoritative sources. This aids in shaping the model's search space based on established data, ensuring a well-informed optimisation process.

<p align="center">
  <img width="450" src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/3d.png">
</p>

## Incorporating Priors for Parameter Ranges

ARTEMIS provides a mechanism for users to integrate prior knowledge, constraints which can be considered as "priors" (though these are not priors in the Bayesian sense), into the optimisation process. This becomes essential when there's academic backing or established data for certain parameter values. By doing so, the optimisation aligns more closely with known insights, which is pivotal in forestry statistics where data may be susceptible to inconsistencies.

To integrate such "priors" in ARTEMIS, one needs to define the bounds for each parameter, complemented by the range informed by prior knowledge. This combination ensures that the optimisation is both grounded in domain expertise and statistically robust.

Forestry statistics presents its own set of complexities, especially when modelling intricate systems or handling noisy datasets. In this context, the need arises for adaptable algorithm selection tools. We make use of the Nevergrad optimisation platform to achieve parameter optimisation. However, other libraries eg Optuna, can be used also. Incorporating Nevergrad's NGOpt into ARTEMIS ensures that its optimisation methods are in line with proven strategies, all while addressing the multifaceted challenges of forestry statistics. 

## Details

The demo dataset has been sourced from the U.S. Department of Agriculture, Forest Service, Pacific Southwest Research Station:

McPherson, E. Gregory; van Doorn, Natalie S.; Peper, Paula J. 2016. Urban tree database. Fort Collins, CO: Forest Service Research Data Archive. Updated 21 January 2020. https://doi.org/10.2737/RDS-2016

## Author

Charles Shaw, enquiries: charles@fixedpoint.io
