#' @title Probability Density Function of the Own Distribution
#'
#' @description
#' Evaluates the probability density function (PDF) of the Own
#' continuous distribution at given values of \code{x}.
#'
#' @param x A numeric value or vector where the density function is evaluated.
#'
#' @return A numeric vector with the corresponding density values.
#'
#' @details
#' The Own distribution is defined on the interval (0, 1) with
#' probability density function:
#'
#' \deqn{
#' f(x) =
#' \begin{cases}
#' 1 + \sin(2\pi x), & 0 < x < 1 \\
#' 0, & \text{otherwise}
#' \end{cases}
#' }{f(x) = 1 + sin(2*pi*x) for 0 < x < 1, and 0 otherwise}
#'
#' It is a valid density because \eqn{0 \le f(x) \le 2}{0 <= f(x) <= 2}
#' and \eqn{\int_0^1 f(x)\,dx = 1}{the integral of f(x) from 0 to 1 is 1}.
#'
#' This function is vectorized and returns 0 for values outside the support.
#'
#' @examples
#' dOwn(0.25)
#' dOwn(c(0.1, 0.5, 0.75))
#' integrate(dOwn, 0, 1)
#'
#' @export
dOwn <- function(x){
  ifelse(x > 0 & x < 1, 1 + sin(2 * pi * x), 0)
}
