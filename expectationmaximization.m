%Project 3 - Ashley Covington

%initialization

%need BETA variable, p, g. Expectation. variable to store parameter
%estimates after s iterations. s?

fid = 'y.dat';
X = importdata(fid,',');

var0 = 1;
var1 = 4;

n = 5;

%thetas initialized with random numbers for part 7.1
theta_0 = [];
theta_0(1) = 26.0;
theta_0(2) = 20;
theta_0(3) = 19;
theta_0(4) = 32;
theta_0(5) = 15;

%array of beta values
B = [];
p = [];
u0 = [];
u1 = [];

% parameter estimation 
%TODO: LOOP THROUGH 1 to 5, IMPORT DATA AND USE IT. CALCULATE PARAMETER
%ESTIMATES IN FOR LOOP USING BELOW VARIABLES AND ARG MAX

%B
for j=1:5
    p2 = normpdf(X(j),theta_0(j)^j,var0) + normpdf(X(j),theta_0(j)^j,var1);
    g = (normpdf(X(j),theta_0(j)^j,var1));
    denom = p2^j*g + (1-p2^j)*(normpdf(X(j),theta_0(j),var0));
    B(j) = (p2*g)/denom;
  
    %estimate = max(B(j)^j*log(p*g) + (1-B(j)^j)*log((1-p)*g))
end

for s=1:5
    p(s+1) = (1/n)*B(s)^s;
    u0(s+1) = (1-B(s)^s)*X(j)/(1-B(s));
    u1(s+1) = (B(s)^s)*X(j)/(B(s));
    
end

currenttheta = 55;
u0 = 55;
u1 = 50

for i=1:1000
    p = normpdf(X(i),currenttheta,var0) + normpdf(X(i),currenttheta,var1);
    g = (normpdf(X(i),currenttheta,var1));
    B = (p*g)/(p*g+(1-p)*(normpdf(X(i),currenttheta,var0)));
    
    
    
    p(i+1) = (1/n)*B^i;
    u0(i+1) = (1-B^i)*X(j)/(1-B);
    u1(i+1) = (B^i)*X(j)/(B);
    
    
end
