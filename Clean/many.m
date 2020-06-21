n = 100;

f1 = parfeval(@() droid(n), 1);
f2 = parfeval(@() droid(n), 1);

t1 = fetchOutputs(f1);
t2 = fetchOutputs(f2);

figure; hold on;
scatter(t1, 1:n)
scatter(t2, 1:n)