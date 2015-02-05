prob = parameters(1,end)
mu0 = parameters(2,end)
mu1 = parameters(3,end)

figure(1);
title('Deviation from actual value');
xlabel('iterations');
hold on
plot(parameters(1,:)-prob);
plot(parameters(2,:)-mu0);
plot(parameters(3,:)-mu1);
hold off

figure(2);
title('Convergence on actual value');
xlabel('iterations');
hold on
plot(parameters(1,:));
plot(parameters(2,:));
plot(parameters(3,:));
hold off
