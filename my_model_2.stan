// Model 2

data {
  int<lower=1> N;       // number of observations
  vector[N] log_gest;    // 
  vector[N] log_weight;     // 
  vector[N] preterm;
}

transformed data{
  vector[N] interation_term;
  interation_term = log_gest .* preterm;
}

parameters {
  real beta1;
  real beta2;
  real beta3;
  real beta4;
  real<lower=0> sigma;
}

model {
  sigma ~ normal(0,1);
  beta1 ~ normal(0,1);
  beta2 ~ normal(0,1);
  beta3 ~ normal(0,1);
  beta4 ~ normal(0,1);
  log_weight ~ normal(beta1 + beta2*log_gest + beta3*preterm + beta4*log_gest , sigma^2);
}