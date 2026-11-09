#' @title Random Number Generation for the Own Distribution
#'
#' @description
#' Generates random numbers from the Own continuous distribution using the
#' inverse transform method. Since \eqn{F(x) = U} cannot be solved for
#' \eqn{x} algebraically, it is solved numerically with \code{uniroot()}.
#'
#' @param n Number of observations to generate (a positive integer).
#'
#' @return A numeric vector of length \code{n} with values in (0, 1).
#'
#' @details
#' Inverse transform method: if \eqn{U \sim U(0,1)}{U ~ U(0,1)}, then
#' \eqn{X = F^{-1}(U)}{X = F^-1(U)} follows the Own distribution.
#'
#' For each \eqn{U} we must solve
#'
#' \deqn{x + \frac{1 - \cos(2\pi x)}{2\pi} = U}{x + (1 - cos(2*pi*x)) / (2*pi) = U}
#'
#' With \eqn{\theta = 2\pi x}{theta = 2*pi*x} this becomes
#' \eqn{\theta - \cos\theta = 2\pi U - 1}{theta - cos(theta) = 2*pi*U - 1},
#' a transcendental equation with no algebraic solution. Therefore the root of
#'
#' \deqn{g(x) = F(x) - U = 0}{g(x) = F(x) - U = 0}
#'
#' is found with \code{uniroot()} on the interval from 0 to 1. The root
#' exists and is unique because \eqn{g(0) < 0}, \eqn{g(1) > 0} and \eqn{g}
#' is strictly increasing.
#'
#' Algorithm:
#' \enumerate{
#'   \item Generate \eqn{U \sim U(0,1)}{U ~ U(0,1)} with \code{runif()}.
#'   \item Solve \eqn{F(x) - U = 0} with \code{uniroot()}.
#'   \item The root \eqn{x} is an observation of the Own distribution.
#' }
#'
#' @examples
#' set.seed(123)
#' x <- rOwn(1000)
#' mean(x)
#' hist(x, freq = FALSE)
#' curve(dOwn(x), add = TRUE, col = "red")
#'
#' @export
rOwn <- function(n){
  if (length(n) != 1 || n < 1) stop("n must be a positive integer")
  u <- runif(n)                                   # Step 1: U ~ Uniform(0,1)
  sapply(u, function(ui){                         # Step 2: solve F(x) - U = 0
    uniroot(function(x) pOwn(x) - ui,
            interval = c(0, 1), tol = 1e-10)$root # Step 3: x = F^-1(U)
  })
}
