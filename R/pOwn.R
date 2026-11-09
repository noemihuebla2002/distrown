#' @title Cumulative Distribution Function of the Own Distribution
#'
#' @description
#' Evaluates the cumulative distribution function (CDF) of the Own
#' continuous distribution, that is, \eqn{P(X \le x)}{P(X <= x)}.
#'
#' @param x A numeric value or vector of quantiles.
#'
#' @return A numeric vector with the corresponding cumulative probabilities.
#'
#' @details
#' The CDF is obtained by integrating the density from 0 to \code{x}:
#'
#' \deqn{
#' F(x) =
#' \begin{cases}
#' 0, & x \le 0 \\
#' x + \dfrac{1 - \cos(2\pi x)}{2\pi}, & 0 < x < 1 \\
#' 1, & x \ge 1
#' \end{cases}
#' }{F(x) = 0 if x <= 0; x + (1 - cos(2*pi*x)) / (2*pi) if 0 < x < 1; 1 if x >= 1}
#'
#' This function is vectorized.
#'
#' @examples
#' pOwn(0.5)
#' pOwn(0.75) - pOwn(0.25)
#'
#' @export
pOwn <- function(x){
  ifelse(x <= 0, 0,
         ifelse(x >= 1, 1,
                x + (1 - cos(2 * pi * x)) / (2 * pi)))
}

