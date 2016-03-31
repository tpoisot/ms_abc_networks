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
    caption: Z-score of *average* distances for the best-matching simulations. Herbivory and pollination networks are better predicted by this model, while z-scores for seed dispersal, prasitism, and bacteriophagy, are centered around 0. The differences in z-scores may come for the fact that macro-evolutionary processes have a stronger footprint on the extant structure of some types of interactions(herbivory, pollination). 
    short: Predictive power of the model across different types of networks.
    file: ../figures/z-scores.pdf
    wide: true
  - id: tree
    caption: Classification tree on parameters $c$ and $\lambda$. Networks are split in two main groups (herbivory and pollination, others) by $\lambda$. It is worth noting that the groups do not delineate antagonistic (grey labels) from mutualistic (black labels) interactions. The two longest branches have been shortened.
    short: Classification tree of the networks as a function of best parameters values.
    file: ../figures/tree-cleaned.pdf
date: \today
abstract: Ecological networks represent the backbone of biodiversity. As species diversify over macro-evolutionary time-scales, the structure of these networks changes; this happens because species are gained, and lost, and therefore add or remove interactions in their communities. However, the dynamics of the structure of ecological networks is still poorly understood. Here we show that several types of ecological interactions share common evolutionary mechanisms, that can be parameterized based on extant interaction data. We found that a model mimicking birth-death processes for species interactions describes the structure of extant networks well. Types of ecological interactions (seed dispersal, herbivory, parasitism, bacteriophagy, and poolination), only differed in the position they occupy in the parameters multi-dimensional space. Notably, we found no clustering of parameters values between antagonistic and mutualistic interactions. Our results provide a common modelling framework for the evolution of ecological networks, that can be parameterized, and is explicit about species interactions. We anticipate this result to contribute to the greater consideration of species interactions in models of macro-evolution and adaptive radiations.
---

The extant structure and distribution of biodiversity is the outcome of macro-
evolutionary processes, and the modeling of these processes stimulated a large
variety of approaches [@maruvka_mfm; @nee_bmm]. At their core, these
approaches are all essentially birth-death processes, in that they model the
rate of speciation and extinction to generate a prediction about both the
temporal dynamics of species richness and its predicted current state.
Surprisingly, these models tend to consider species as isolated entities; even
though they share ancestry, they are not involved in inter-specific
interactions. This is problematic from both an ecological [@gravel_tti] and
evolutionary [@eklof_reh; @stouffer_ecs] standpoint since it is widely
accepted that interactions serve as an essential *scaffold* for community
persistence. After all, plants require pollinators, predators require prey,
hosts require parasites, etc.

Although modern macro-ecological models give an increasingly central role
to interactions [@thuiller_rmf], such models are still unable to predict
the structure of complex interactive communities [@jablonski_bim].
Nevertheless, there are two key observations upon which solutions to
overcome this limitation can be devised. First, extant networks are decidedly
non-random with regard to their structure, and their structure is non-random
with regards to macro-evolutionary processes [@stouffer_ecs]. Second, the
structure of ecological networks is dynamic over evolutionary timescales
[@roopnarine_eps]. This is strongly suggestive of perpetual and ongoing action
of macro-evolutionary processes. Models of macro-evolution with explicit
consideration of species interactions will therefore give a theoretical
framework to understand how networks evolve. Such a framework enables
the estimation of how much of their extant structure originated through
macro-evolution, as opposed to reflecting extant opportunities and constraints.

If one assumes that an incipient species inherits its ancestor's interactions
upon speciation {>>ref<<}, even a simple model with relatively few parameters
can describe the possible evolutionary rules that shape the community's
interaction network. Ideally, the parameters of any model such as this---no
matter how simple or complex---ought to be calibrated against real-world
evolutionary dynamics, similar to comparable to that how the extensive
fossil and molecular record has been used to study  species diversification
{>>ref<<}. Unfortunately, the dearth of well-resolved long-term time series of
species interactions rules out such a comparison to temporal network dynamics
[@donoghue_rcc]. Therefore, we instead addressed the question of network
macro-evolution here by using extant ecological networks to calibrate an
interaction-centric birth-death simulation model under the assumption that
the best-fitting models will provide insight into the network's likely
evolutionary history. Among all possible shapes of ecological networks,
bipartite ones (describing the interactions between two guilds) are an ideal
family to test this model: they have well partitioned interactions between
guilds with no complex feedback loops, are present in a variety of systems
and types of biological interactions, and there is a wealth of well-studied
data available. {==Did I segued the shit out of that or what?==} Because taxa
from both guilds of a bipartite network are usually tightly evolutionarily
linked and require interactions to persist, they are ideal to elucidate
evolutionary rules of community structure.

We posit that four simple rules govern the evolution of networks. First,
every network is originally two species sharing a single interaction; for
example, a plant and its herbivore. Second, a speciation event happens at the
top level (the herbivore) with probability $p$, or at the bottom level with
probability $1-p$. Third, the incipient species starts with all interactions
of its ancestor. Fourth, some of these interactions are lost with probability
$\epsilon(\lambda, c, k)$, which allows interactions (that are gained through
speciation) to be lost either at a fixed rate $\lambda$ or as a function
of the incipient species' degree $k$ (the $c$ parameter modulates whether
high degree in the ancestor increases, or decreases, the probability of
losing interactions in the incipient).  Comparing model-generated networks
with different parameters reveals key macro-evolutionary drivers of network
structure. For example, if the evolutionary dynamics of interactions are
critical for the evolutionary dynamics of communities, we expect that the
values of any speciation-related parameters will be less important than
those of interaction-related one(s).

Following our macro-evolutionary model, we repeated its four steps $10^4$
times to generate a large ensemble of model networks whose structure we
could compare to those of the empirical networks. We then compared these
model- generated networks to a large collection of 271 bipartite ecological
networks whose interactions encode seed dispersal, herbivory, parasitism,
bacteriophagy or pollination (see *Methods*)  using Approximate Bayesian
Computation (ABC).  ABC [@csillery_abc; @wilkinson_abc] gives estimates
of posterior distribution (*i.e.* most likely parameter values given the
empirical data) of best-fit parameters by comparing a measure of distance
between empirical observations and a model, when no analytical expression
of likelihood can be derived. We define the distance between a simulated
($i$) and empirical ($j$) network as $\text{d}(\mathbf{v}_i, \mathbf{v}_j)$,
where $\mathbf{v}$ is an array of network structural properties, including
connectance, modularity [@olesen_mpn], nestedness [@bastolla_amn], and the
distribution of different network motifs [@stouffer_efe] (see *Methods*). The
posterior distribution of best-fitting parameters, for each network, is the
parameters of the closest 500 simulated models ($1\%$ of the total).


!{posteriors}

We first observed that the posterior distribution of the parameters differs
across interaction types (\autoref{posteriors}). The probability of speciation
at either level ($p$) is the least strongly selected, which suggests that
mechanisms pertaining to the evolution of interactions have a stronger impact
on extant network structure than does the distribution of speciation rates. We
also encountered two situations for the distribution of the interaction rate
$\lambda$: herbivory and pollination networks have higher values of this
parameter, implying that herbivores and pollinators tend to retain the
interactions of their ancestors more than herbivores did {>>ref<<}. All other types of
networks were best described by low values of $\lambda$; their interactions
consequently appear to be more labile throughout the course of evolution.
Finally, all systems show a strong bias towards moderately high values of $c$;
this indicates that the effective probability of a species retaining its
ancestor's interactions decreases with its ancestor's degree. That is, the
generalism of species over time has a <!--DBS: strict?--> upper bound, a fact
that results in the very spectrum of high-degree and low-degree species that
is ubiquitous empirically [@poisot_cff; @williams_bmc].

The optimal values of $\lambda$ and $c$, however, are not independent since
they ultimately affect the same process: the probability of the incipient
species losing its ancestor's interactions. A more thorough understanding of
the dynamics of interactions throughout evolution can therefore be obtained by
examining these parameters' joint distribution. Doing so reveals two possible
"states" for networks to occupy based on the results of our model
(\autoref{parameters}); either $c$ is close to 0 and $\lambda$ is large or $c$
is close to 1 and $\lambda$ is low. Notably, different types of networks fall
in a specific place within this continuum. Herbivory and pollination tend to
have both low values of $c$ and low to high values of $\lambda$---implying
that foobar, foo, and bar---whereas parasitism networks have low values of
$\lambda$ and low-to-high values of $c$---implying that varza, barsom, and
Zoroaster himself. The two remaining network types, seed dispersal and
bacteriophagy, do not show a strong signal as to their position alongside this
gradient.

!{parameters}

For each network, we next calculated the average distance to all its best
matching simulation outputs, and used the z-score of this value to determine
which type of networks was best predicted using our model (\autoref{zscores}).
The best predicted networks were herbivory and pollination; this suggest
that these networks have a strong macro-evolutionary signal.

!{zscores}

Finally, we applied a classification tree to the parameter values describing
each empirical network (\autoref{tree}). The tree had a misclassification
rate of 35.4%, meaning that knowing only the value of parameters $\lambda$
and $c$, the correct type of ecological interaction can be estimated in
around 65% of cases. The structure of tree also reveals that antagonistic
and mutualistic interactions *do not* form different clusters [as opposed
to what has been hypothesized before @thebault_sec], which contradicts
the frequent assumption that different *consequences* of the interaction
should imply different evolutionary rules and trajectories [@thompson_shg;
@thompson_tda; @fontaine_eei].

!{tree}

***In conclusion it works well, please send this paper for review***

# Methods

## Data selection

We used empirical data of plant-pollinator interactions (59 networks),
plant-herbivore interactions (23 networks), phage-bacteria networks
(38 interactions), plant-dispersers interactions (30 networks), and
host-parasite interactions (121 networks). Pollination and seed-dispersal
interactions come from the *WebOfLife* database {>>ref<<}. Phage-bacteria
(which are functionally equivalent to host-parasitoid) data are from Ref
@flores_ssh. Host-parasite data are from Ref @stanko_mdp. Plant-herbivore
data are from Ref @thebault_das. Every network was "cleaned" in the following
way. First, species with no interactions (if any) were removed. Second,
interactions strengths (if present) were removed. This yields adjacency
matrices in which all species have at least one interaction.

## Simulations

We conducted the following two numerical experiments. First, we conducted a
systematic exploration of the model's behaviour using evenly spaced parameter
values. Each combination of parameters was simulated 1000 times. This
allowed us to ensure that the model could return networks with all possible
configurations, and that the output covered a range of network structures
larger than what was observed in nature. Second, we sampled the parameter
space uniformly, by drawing $10^5$ parameter sets at random from within the
aforementioned bounds. These outputs were used in the parameter selection
experiment described below.

{>>missing an overview of the steps<<}

These three steps are repeated $10^4$ times, for $10^5$ random combinations
of $<p, \lambda, c>$. Whenever either level has more than $10^2$ species,
some are deleted at random within this level. This ensure that the network
is at most composed of 200 species. Preliminary analyses revealed that this
threshold had no impact on the results presented as long as it was reasonably
large ($\geq 50$).

## Network measures

We measured four key families of bipartite network structure indices. Measures
were ranged in $[0,1]$. First, connectance, which is the $\frac{L}{T\times
B}$, with $L$ the number of interactions, and $T$ and $B$ the number of
species in the top and bottom groups. Second, nestedness [@almeida-neto_cmf],
using the NODF measure, which {==todo==}. Third, modularity, using LP-BRIM
[@liu_cdl; @barber_dnc], which gives values close to 1 when there are modules
in the network, and values closer to 0 otherwise. Finally, we measured the
proportion of {==xx==} bipartites motifs [@baker_srf]. {>>more<<}

So that the motif statistics would also fall in the range $[0,1]$, we corrected
the raw number of motifs to account for the number of species in each layer
of the bipartite network. For example, the maximum number of motifs with
2 species at the top and 2 species at the bottom is the product of the
number of combinations of 2 species in the top layer, and of 2 species in
the bottom layer (evaluated by their binomial coefficients $\choose{T}{2}$
and $\choose{B}{2}$, respectively). This gives a total number of sets of
species that *could* be involved in a $2 \times 2$ motif. Note that this
implies that all values represent the proportion of sets of species that *do*
form a given motif out of the sets of species that *could*.

## Parameter selection

We used ABC (Approximate Bayesian Computation) to select the parameter values
that yielded realistic networks by assessing how closely each replicate of the
second numerical experiment resembles empirical communities. For each empirical
network, its observed set of summary statistics was compared to each output of
the stochastic model. The inverse of the Euclidean distance between the two
arrays was recorded as the score of the parameter set. As every empirical
network had different absolute values of scores, fixing a common threshold was
not feasible. We then selected the posterior distribution as the 500 parameters sets
that gave the best scores (i.e. above the 95th percentile). {>>ref<<}?

## Decision tree

We used a classification tree to separate the networks along the continuum
of values of $c$ and $\lambda$. The response was the type of networks, and
the classifiers where the $\text{log}_{10}$ of $c$ and $\lambda$. We used the
implementation from the `tree` package (v. 1.0.36) for `R` (v. 3.2.2). Splits
where decided according to Gini ratio. {>>weights?<<} <!--DBS: Yes, probably...-->

# References
