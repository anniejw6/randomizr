% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster_rs.R
\name{cluster_rs}
\alias{cluster_rs}
\title{Cluster Random Sampling}
\usage{
cluster_rs(clust_var, m = NULL, prob = NULL, simple = FALSE)
}
\arguments{
\item{clust_var}{A vector of length N that indicates which cluster each unit belongs to.}

\item{m}{Use for a design in which m clusters are sampled. (optional)}

\item{prob}{Use for a design in which either floor(N_clusters*prob) or ceiling(N_clusters*prob) clusters are sampled. The probability of being sampled is exactly prob because with probability 1-prob, floor(N_clusters*prob) clusters will be sampled and with probability prob, ceiling(N_clusters*prob) clusters will be sampled. prob must be a real number between 0 and 1 inclusive. (optional)}

\item{simple}{logical, defaults to FALSE. If TRUE, simple random sampling of clusters. When simple = TRUE, please do not specify m.}
}
\value{
A numeric vector of length N that indicates if a unit is sampled (1) or not (0).
}
\description{
cluster_rs implements a random sampling procedure in which groups of units are sampled together (as a cluster). This function conducts complete random sampling at the cluster level, unless simple = TRUE, in which case \code{\link{simple_rs}} analogues are used.
}
\examples{
clust_var <- rep(letters, times=1:26)

S <- cluster_rs(clust_var = clust_var)
table(S, clust_var)

S <- cluster_rs(clust_var = clust_var, m = 13)
table(S, clust_var)

}

