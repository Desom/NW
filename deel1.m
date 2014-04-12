%% 1.1 Vast deelinterval

% Eerste functie
uitkomst1 = exp(1) - exp(-1);

trapezium_integratie_fout1 = zeros(1,100);
simpson_integratie_fout1 = zeros(1,100);
h1 = zeros(1,100);

for n=1:100
    trapezium_integratie_fout1(n) = abs(uitkomst1 - trapezium(@func1,-1,1,n * 100));
    simpson_integratie_fout1(n) = abs(uitkomst1 - simpson(@func1,-1,1,n * 100));
    h1(n) = 2 / n;
end

figure(1)
semilogy(h1,trapezium_integratie_fout1)

figure(2)
semilogy(h1,simpson_integratie_fout1)

% Tweede functie
uitkomst2 = 2 * atan(5);

trapezium_integratie_fout2 = zeros(1,100);
simpson_integratie_fout2 = zeros(1,100);
h2 = zeros(1,100);

for n=1:100
    trapezium_integratie_fout2(n) = abs(uitkomst2 - trapezium(@func2,-5,5,n * 100));
    simpson_integratie_fout2(n) = abs(uitkomst2 - simpson(@func2,-5,5,n * 100));
    h2(n) = 10 / n;
end

figure(3)
semilogy(h2,trapezium_integratie_fout2)

figure(4)
semilogy(h2,simpson_integratie_fout2)

%% 1.2 Adaptieve routine

