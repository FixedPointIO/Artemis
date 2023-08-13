<p align="centre">
  <a href="https://github.com/fixedpointexperimental/Artemis">
    <img src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/artemis.jpg" alt="Artemis" width="150">
  </a>
</p>

# ARTEMIS

**ARTEMIS** (Advanced Regression and Tree Estimation Model for Integrated Silviology) is a sophisticated Python package tailored for forestry statistics. It breathes innovation into this traditional domain by adopting state-of-the-art optimisation techniques to pinpoint the Chapman-Richards growth function. While ARTEMIS provides a comprehensive toolkit for deducing tree and forest growth variables, its true prowess lies in adeptly managing forestry data riddled with noise and potential outliers.

Developed by **FixedPoint IO Ltd** in collaboration with **Climate Impact Partners**.

## Features

- **Evolutionary Optimisation for Growth Function**: While the Chapman-Richards function is a standard in forestry, ARTEMIS stands out by using evolutionary algorithms for parameter optimisation, ensuring a more robust deduction of tree and forest growth metrics.
- **Data Refinement**: Dedicated scripts to meticulously sift and refine forestry data.
- **State-of-the-art Optimisation**: Leverages Nevergrad, a leading-edge optimisation library, to adeptly shape growth model parameters, even amidst noisy forestry data.
- **Prior Inclusion and Search Space Customisation**: With ARTEMIS, users can seamlessly incorporate priors from authoritative sources like academic literature. This empowers them to tailor the model's search space based on established "ground truth", guaranteeing an optimisation process that's both knowledgeable and accurate.


<p align="centre">
  <a href="(https://github.com/fixedpointexperimental/Artemis)">
    <img src="https://github.com/fixedpointexperimental/Artemis/blob/main/images/3d.png" alt="Artemis" width="450" height="450">
  </a>
</p>

## Incorporating Priors for Parameter Ranges

Within ARTEMIS, there's a distinctive feature permitting users to embed prior knowledge, or "priors", into the optimisation process for parameter bounds. Such priors prove invaluable when academic evidence or factual data bolsters certain parameter values, thus steering the optimisation towards values congruent with extant insights. This facet is especially crucial in forestry statistics, a realm frequently encountering data susceptible to noise and outliers.

To employ priors within ARTEMIS, simply specify the intended bounds for each parameter coupled with your knowledge range. The optimisation journey is then informed by these priors, aiding you in securing more pertinent and precise parameter approximations. Priors can be anchored to metrics like tree growth rates (A), decay constants (k), and shape parameters (p), letting you amalgamate domain expertise with statistical optimisation for steadfast outcomes.

## Intelligent Optimisation

Forestry statistics, an integral branch of applied statistics, has a storied past. Yet, dissecting forestry data unfurls a plethora of challenges due to the inherent intricacies of the systems modelled and a dearth of robust quantitative data for many involved factors. 

In the realm of automatic optimisation, myriad challenges sprout from the eclectic requirements of real-world problems. Addressing these necessitates versatile algorithm selection tools—those robust and adept at earmarking the most efficient algorithm for distinct problem instances. Amongst the myriad, NGOpt, nestled within the Nevergrad optimisation platform, stands as a beacon of hand-crafted brilliance. It's a culmination of rigorous research and cyclic refinement.

For ARTEMIS, the assimilation of NGOpt translates to harnessing a tool that's not just multifaceted but also empirically substantiated. By tapping into NGOpt's prowess, ARTEMIS ensures its optimisation endeavours always resonate with the prime strategies, vouching for optimal solutions across variegated forestry conundrums. Notably, ARTEMIS utilises evolutionary algorithms, a testament to its forward-thinking approach in parameter optimisation.

## Contact

For technical queries and support, please reach out to:

Charles
Email: charles@fixedpoint.io

The demo dataset is courtesy of the U.S. Department of Agriculture, Forest Service, Pacific Southwest Research Station:

McPherson, E. Gregory; van Doorn, Natalie S.; Peper, Paula J. 2016. Urban tree database. Fort Collins, CO: Forest Service Research Data Archive. Updated 21 January 2020. https://doi.org/10.2737/RDS-2016-0005
