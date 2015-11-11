---
title: How ecological networks evolve
short: Network macro-evolution
bibliography: default.json
csl: nature.csl
author:
  - family: Poisot
    given: Timothée
    affiliation: 1, 2, 3
    email: tim@poisotlab.io
    id: tp
    orcid: 0000-0002-0735-5184
  - family: Stouffer
    given: Daniel B.
    affiliation: 1
    id: dbs
affiliation:
  - id: 1
    text: Centre for Integrative Ecology, School of Biological Sciences, University of Canterbury, Christchurch, New Zealand
  - id: 2
    text: Université de Montréal, Département de Sciences Biologiques, 90 Avenue Vincent d'Indy, Montréal, QC, CAN, H2V3S9
  - id: 3
    text: Québec Centre for Biodiversity Sciences, 1205 Dr. Penfield Avenue, Montréal, QC, CAN, H3A1B1
keyword:
  - k: ecological networks
  - k: Approximate Bayesian Computation
  - k: bipartite networks
  - k: macroevolution
figure:
  - id: posteriors
    caption: Posterior distributions of parameters $p$, $\text{log}_{10}\lambda$ and $\text{log}_{10}c$. The grey shaded area is a representation of the uniform prior distribution. Although there is no strong selections on the values of $p$, networks do differ strongly both from the prior, and from one another, on $\lambda$ and $c$.
    short: Posterior distributions of parameters $p$, $\lambda$ and $c$.
    file: ../figures/posteriors.pdf
    wide: true
  - id: parameters
    caption: Relationships between parameters $\lambda$ and $c$ in the five different types of networks. The grey points indicate all networks in the dataset. Different types of ecological interactions occupy different positions along the $\lambda$-$c$ continuum.
    short: Relationships between parameters $\lambda$ and $c$.
    file: ../figures/interaction-params.pdf
    wide: true
  - id: zscores
    caption: Z-score of *average* distances for the best-matching simulations. Herbivory and pollination networks are better predicted by this model, while z-scores for seed dispersal, prasitism, and bacteriophagy, are centered around 0. The differences in z-scores may come for the fact that evolutionary processes have a stronger footprint on the extant structure of some types of interactions(herbivory, pollination). 
    short: Predictive power of the model across different types of networks.
    file: ../figures/z-scores.pdf
    wide: true
date: Work in progress.
abstract: Here be science yo.
---

The extant structure and distribution of biodiversity is the outcome of
macro-evolutionnary processes, and the modeling of these processes stimulated a
large variety of approaches [@maruvka_mfm; @nee_bmm]. At their core, these
approaches are birth-death processes, in that they model the rate of speciation
and extinction to generate a prediction about both the temporal dynamics of
species richness, and its predicted current state. Yet these models often
consider species as isolated entities, in that even though they share ancestry,
they are not involved in inter-specific interactions. This is problematic, as
from an ecological [@gravel_tti] and evolutionary [@eklof_reh; @stouffer_ecs]
standpoint, interactions serve as a *scaffold* for community persistence: plant
require pollinators, predators require preys, etc.

Although modern macro-ecological models give an increasingly central role to
interactions [@thuiller_rmf], macro-evolution models are still unable to predict
the structure of complex interactive communities [@jablonski_bim]. Two key
observations motivate the overcoming of this limitation. First, extant networks
are non-random in their structure, and displays a strong macro-evolutionary
signal [@stouffer_ecs]. Second, the structure of ecological networks is dynamic
over evolutionary timescales [@roopnarine_eps]. This is strongly suggestive of
ongoing action of macro-evolutionary processes. Models of macro-evolution with
explicit consideration of species interactions will provide a theoretical
understanding of how networks evolve, and how much of their extant structure
originated through evolutionary processes.

Yet the relative lack of well-resolved long-term time series of species
interactions rule out the comparison of temporal dynamics [@donoghue_rcc]
the (comparatively) extensive fossil and molecular record of species
diversification allows. We addressed the question of network macro-evolution
by confronting extent (bipartite) networks with the outcome of a birth-death
simulation models, under the assumption that the best-fitting models will
be a representation of the network's evolutionary history. We posit that
the evolution of networks follows a series of simple rules. First, every
network starts as two species with one interaction. Second, a speciation
event happens at the top level with probability $p$, and at the bottom level
with probability $1-p$. Any incipient species start with all interaction
of the ancestor. Third, interactions of the incipient species are lost with
probability $\epsilon(\lambda, c, k)$ (see *Methods Summary*); this allows
interactions to be lost either at a fixed rate $\lambda$, or as a function
of the incipient specie's degree $k$. These three steps are repeated $10^4$
times, for $10^5$ random combinations of $<p, \lambda, c>$. Whenever either
level has more than $10^2$ species, some are deleted at random.

We compared simulation endpoints to 271 bipartite ecological networks
(seed dispersal; herbivory; parasitism; bacteriophagy; pollination --
see *Methods summary*) using Approximate Bayesian Computation (ABC). ABC
[@csillery_abc; @wilkinson_abc] gives estimates of posterior distribution of
parameters by comparing a measure of distance between empirical observations
and a model, when no analytical expression of likelihood can be derived. We
define the distance between a simulated ($i$) and empirical ($j$) network
as $\text{d}(\mathbf{v}_i, \mathbf{v}_j)$, where $\mathbf{v}$ is an array of
network structural properties, including connectance, modularity [@olesen_mpn],
nestedness [@bastolla_amn], and the distribution of different network motifs
[@stouffer_efe] (see *Methods summary*). Measures were ranged in $[0;1]$. The
posterior distribution of best-fitting parameters, for each network, is the
parameters of the closest 500 simulated models.

!{posteriors}

Posterior distribution of the parameters differ across interaction types
(\autoref{posteriors}). The probability of speciation at either level ($p$)
is the least strongly selected, which suggests that mechanisms pertaining
to the evolution of *interactions* have a stronger impact on extent network
structure. There are two situations for the distribution of $\lambda$:
herbivory and pollination networks have higher values of this parameter,
meaning that herbivores/pollinators tend to retain the interactions of their
ancestors {>>ref<<}. All other types of networks were best described by low
values of $\lambda$; their interactions appear to be more labile throughout
coevolution. Finally, all systems show a strong bias towards moderately high
values of $c$; this indicates that the effective probability of retaining
one's ancestor's interactions decreases with ancestor's degree. There is
an upper bound to the generalism of species over time, which results in a
spectrum of high-degree and low-degree species in networks, as described in
many natural systems [@poisot_cff; @williams_bmc].

The joint distribution ofthe $\lambda$ and $c$ parameters
(\autoref{parameters}) reveals two possible "states" for networks to occupy;
either $c$ is close to 0, and $\lambda$ is large, or $c$ is close to 1,
and $\lambda$ is low. There exists a continuum across these two endpoints,
alongside which different types of networks fall. Herbivory and pollination
tend to have both low values of $c$, and low to high values of $\lambda$;
parasitism networks have low values of $\lambda$ and low-to-high values of
$c$. Other types of networks (seed dispersal, bacteriophagy) do not show a
strong signal as to their position alongside this gradient.

!{parameters}

For each network, we next calculated the average distance to all its
best matching simulation outputs, and used the z-score of this value
to determine which type of networks was best predicted using our model
(\autoref{zscores}). The best predicted networks were herbivory and
pollination; this suggest that these networks have a strong evolutionary
signal. By contrast, other types of networks can be less accurately predicted
because they are more sensitive to random chance or ecological mechanisms.

!{zscores}

# Methods summary

## Data selection

We used empirical data from mutualistic interactions (XX networks),
plant-herbivore interactions (XX networks), phage-bacteria networks (XX
interactions), plant-dispersers interactions (XX networks), and host-parasite
interactions (XX networks). Mutualistic and dispersers interactions come from
the *WebOfLife* database. Phage-bacteria (which are functionally equivalent to
host-parasitoid) data are from @flores_ssh. Host-parasite data are from
@stanko_mdp. Plant-herbivore data are from @thebault_das. Each network was
cleaned in the following way. First, species with no interactions (if any) were
removed. Second, interactions strengths (if present) were removed. This yields
adjacency matrices in which all species have at least one interaction.

## Simulations

We conducted the following two numerical experiments. First, we conducted a
systematic exploration of the model's behavior using evenly spaced parameter
values. Each combination of parameters was simulated 1000 times. This
allowed us to ensure that the model could return networks with all possible
configurations, and that the output covered a range of network structure
larger than what was observed in nature. Second, we sampled the parameter
space uniformly, by drawing $10^5$ parameters sets at random from within the
aforementioned bounds. These outputs were used in the parameter selection
experiment described below.

## Network measures

We measured four key families of bipartite network structure indices. First,
connectance, which is the $\frac{L}{T\times B}$, with $L$ the number of
interactions, and $T$ and $B$ the number of species in the top and bottom
groups. Second, nestedness [@almeida-neto_cmf], using the NODF measure,
which {==todo==}. Third, modularity, using LP-BRIM [@liu_cdl; @barber_dnc],
which gives values close to 1 when there are modules in the network, and
values closer to 0 otherwise. Finally, we measured the proportion of {==xx==}
bipartites motifs [@baker_srf]. {>>more<<}

The raw number of motifs was corrected to account for the number of species in
each layer of the bipartite network. The maximum number of a motif with (e.g.) 2
species at the top and 2 species at the bottom is the product of qthe number of
combinations of 2 species in the top layer, and of 2 species in the bottom layer
(evaluated by their binomial coefficients). This gives a total number of sets of
species that *could* be involved in a 2x2 motif; the raw number of this motif is
divided by this maximum number. This yields values in the 0-1 range,
representing the proportion of sets of species that *do* form a given motif out of
the sets of species that *could*.

## Parameter selection

We used ABC (Approximate Bayesian Computation) to select the parameter values
that yielded realistic networks, by assessing how closely each replicate of the
second numerical experiment resembles empirical communities. For each empirical
network, its array of ranged summary statistics was compared to each output of
the stochastic model. The inverse of the Euclidean distance between the two
arrays was recorded as the score of the parameter set. As every empirical
network had different absolute values of scores, fixing a common threshold was
not feasible. We selected the posterior distribution as the 500 parameters sets
that gave the best scores (i.e. above the 95th percentile).

# References
