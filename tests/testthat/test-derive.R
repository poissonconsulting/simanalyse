context("function-derive")

test_that("sma_derive works", {
  set.seed(10L)
  code <- "for(i in 1:10){x[i] ~ dnorm(0,1/variance)}"
  parameters = nlist(variance=4)
  dat <- sims::sims_simulate(code, parameters = parameters, nsims=2)
  res <- sma_analyse_bayesian(dat, code, code.add = "variance ~ dunif(0,10)", 
                              n.adapt=100, n.burnin=0, n.iter=3, monitor="variance")
  sma_derive(res, "sd=sqrt(variance)")
  sma_derive(parameters, "sd=sqrt(variance)")
})
