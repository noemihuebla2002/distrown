#' @title Chi-square Goodness of Fit Test "Own"
#'
#' @description
#' Evaluates whether a sample comes from the theoretical distribution
#' defined by \code{dOwn}, using the Chi-square goodness-of-fit test.
#'
#' @usage chisqOwn(sample)
#'
#' @param sample Numeric vector containing the sample to be evaluated.
#'
#' @details
#' The interval (0, 1) is divided into 8 classes of width \eqn{h = 0.125}.
#' The theoretical probability of each class is computed with the
#' cumulative distribution function:
#' \deqn{
#' p_i = F(x_i) - F(x_{i-1})
#' }{pi = F(xi) - F(x(i-1))}
#'
#' where \eqn{F(x)} is the cumulative distribution function \code{pOwn}.
#' The test statistic is
#' \deqn{
#' \chi^2 = \sum_{i=1}^{8} \frac{(O_i - n p_i)^2}{n p_i}
#' }{X2 = sum((Oi - n*pi)^2 / (n*pi))}
#' with \eqn{8 - 1 = 7} degrees of freedom.
#'
#' The procedure includes:
#' \itemize{
#'   \item Constructing a histogram with the theoretical density
#'   \item Computing observed frequencies
#'   \item Obtaining theoretical probabilities
#'   \item Applying the Chi-square test
#' }
#'
#' A sample size of at least 400 is recommended, so that every expected
#' frequency \eqn{n p_i} is at least 5.
#'
#' @return
#' An object of class \code{htest} containing the test results.
#'
#' @examples
#' x <- rOwn(1000)
#' chisqOwn(x)
#'
#' @export
chisqOwn <- function(sample){
  breaks <- seq(0, 1, 0.125)
  h <- graphics::hist(sample, breaks = breaks, probability = TRUE,
                      main = "Sample vs Population",
                      xlab = "x", ylim = c(0, 2.2), col = "lightblue")
  graphics::curve(dOwn, from = 1e-6, to = 1 - 1e-6, n = 501,
                  add = TRUE, lwd = 2, col = "red")
  f  <- h$counts                 # observed frequencies
  pr <- diff(pOwn(breaks))       # theoretical probabilities
  stats::chisq.test(f, p = pr)
}

