% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/declare_ra.R
\name{conduct_ra}
\alias{conduct_ra}
\title{Conduct a random assignment}
\usage{
conduct_ra(ra_declaration = NULL, N = NULL, block_var = NULL,
  clust_var = NULL, m = NULL, m_each = NULL, prob = NULL,
  prob_each = NULL, block_m = NULL, block_m_each = NULL,
  block_prob = NULL, block_prob_each = NULL, num_arms = NULL,
  condition_names = NULL, simple = FALSE, balance_load = FALSE)
}
\arguments{
\item{ra_declaration}{A random assignment declaration, created by \code{\link{declare_ra}}.}

\item{N}{The number of units. N must be a positive integer. (required)}

\item{block_var}{A vector of length N that indicates which block each unit belongs to.}

\item{clust_var}{A vector of length N that indicates which cluster each unit belongs to.}

\item{m}{Use for a two-arm design in which m units (or clusters) are assigned to treatment and N-m units (or clusters) are assigned to control. (optional)}

\item{m_each}{Use for a multi-arm design in which the values of m_each determine the number of units (or clusters) assigned to each condition. m_each must be a numeric vector in which each entry is a nonnegative integer that describes how many units (or clusters) should be assigned to the 1st, 2nd, 3rd... treatment condition. m_each must sum to N. (optional)}

\item{prob}{Use for a two-arm design in which either floor(N*prob) or ceiling(N*prob) units (or clusters) are assigned to treatment. The probability of assignment to treatment is exactly prob because with probability 1-prob, floor(N*prob) units (or clusters) will be assigned to treatment and with probability prob, ceiling(N*prob) units (or clusters) will be assigned to treatment. prob must be a real number between 0 and 1 inclusive. (optional)}

\item{prob_each}{Use for a multi-arm design in which the values of prob_each determine the probabilties of assignment to each treatment condition. prob_each must be a numeric vector giving the probability of assignment to each condition. All entries must be nonnegative real numbers between 0 and 1 inclusive and the total must sum to 1. Because of integer issues, the exact number of units assigned to each condition may differ (slightly) from assignment to assignment, but the overall probability of assignment is exactly prob_each. (optional)}

\item{block_m}{Use for a two-arm design in which block_m describes the number of units to assign to treatment within each block. Note that in previous versions of randomizr, block_m behaved like block_m_each.}

\item{block_m_each}{Use for a multi-arm design in which the values of block_m_each determine the number of units (or clusters) assigned to each condition. block_m_each must be a matrix with the same number of rows as blocks and the same number of columns as treatment arms. Cell entries are the number of units (or clusters) to be assigned to each treatment arm within each block. The rows should respect the ordering of the blocks as determined by sort(unique(block_var)). The columns should be in the order of condition_names, if specified.}

\item{block_prob}{Use for a two-arm design in which block_prob describes the probability of assignment to treatment within each block. Differs from prob in that the probability of assignment can vary across blocks.}

\item{block_prob_each}{Use for a multi-arm design in which the values of block_prob_each determine the probabilties of assignment to each treatment condition. block_prob_each must be a matrix with the same number of rows as blocks and the same number of columns as treatment arms. Cell entries are the probabilites of assignment to treatment within each block. The rows should respect the ordering of the blocks as determined by sort(unique(block_var)). Use only if the probabilities of assignment should vary by block, otherwise use prob_each. Each row of block_prob_each must sum to 1.}

\item{num_arms}{The number of treatment arms. If unspecified, num_arms will be determined from the other arguments. (optional)}

\item{condition_names}{A character vector giving the names of the treatment groups. If unspecified, the treatment groups will be named 0 (for control) and 1 (for treatment) in a two-arm trial and T1, T2, T3, in a multi-arm trial. An execption is a two-group design in which num_arms is set to 2, in which case the condition names are T1 and T2, as in a multi-arm trial with two arms. (optional)}

\item{simple}{logical, defaults to FALSE. If TRUE, simple random assignment is used. When simple = TRUE, please do not specify m, m_each, block_m, or block_m_each.}

\item{balance_load}{logical, defaults to FALSE. This feature is experimental. If set to TRUE, the function will resolve rounding problems by randomly assigning "remainder" units to each possible treatment condition with equal probability, while ensuring that the total number of units assigned to each condition does not vary greatly from assignment to assignment. However, the true probabiltiies of assignment may be different from the nominal probabilities specified in prob_each or block_prob_each. Please use with caution and perform many tests before using in a real research scenario.}
}
\description{
You can either give conduct_ra() an ra_declaration, as created by \code{\link{declare_ra}} or you can specify the other arguments to describe a random assignment procedure.
}
\examples{
declaration <- declare_ra(N = 100, m_each = c(30, 30, 40))
Z <- conduct_ra(ra_declaration = declaration)
table(Z)

# equivalent to

Z <- conduct_ra(N = 100, m_each = c(30, 30, 40))
table(Z)

}

