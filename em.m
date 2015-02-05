function [mu_est, sigma_est, p_est, counter, difference] = ...
    gaussian_mixture_model(values, C, epsilon)

values = load y.dat

% get and check inputs
N = length(y)
if (nargin < 3)
  epsilon = 1.0e-4;
end

% initialize
counter = 0;
mu_est = 2*mean(values) * sort(rand(C,1));
sigma_est = ones(C,1)*std(values);
p_est = ones(C,1)/C;
difference = epsilon;

% now iterate
while (difference >= epsilon & counter < 25000)
  % [mu_est, sigma_est, p_est]
  
  % E step: soft classification of the values into one of the mixtures 
  for j=1:5
    class(j, :) = p_est(j) * norm_density(values, mu_est(j), sigma_est(j));
  end
  % normalize
  class = class ./ repmat(sum(class), C, 1);

  % M step: ML estimate the parameters of each class (i.e., p, mu, sigma)
  mu_est_old = mu_est;
  sigma_est_old = sigma_est;
  p_est_old = p_est;
  for j=1:C
    mu_est(j) = sum( class(j,:).*values ) / sum(class(j,:));
    sigma_est(j) = sqrt( sum(class(j,:).*(values - mu_est(j)).^2) /  sum(class(j,:)) );
    p_est(j) = mean(class(j,:));
  end
  
  difference(counter+1) = sum(abs(mu_est_old - mu_est)) + ...
      sum(abs(sigma_est_old - sigma_est)) + ...
      sum(abs(p_est_old - p_est));
  
%   if (mod(counter, 10)==0)
%     fprintf('iteration %d, difference = %.12f\n', counter, difference(counter+1));
%   end
  
  counter = counter + 1;
end


