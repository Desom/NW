%% 1.1 Vast deelinterval

% Eerste functie
uitkomst1 = exp(1) - exp(-1);

trapezium_integratie_fout1 = zeros(1,200);
simpson_integratie_fout1 = zeros(1,200);
h1 = zeros(1,100);

for i=1:200
    n = i * 100;
    trapezium_integratie_fout1(i) = abs(uitkomst1 - trapezium(@func1,-1,1,n));
    simpson_integratie_fout1(i) = abs(uitkomst1 - simpson(@func1,-1,1,n));
    h1(i) = 2 / n;
end

figure(1)
semilogy(h1, h1.^2, 'r');
hold
semilogy(h1,trapezium_integratie_fout1)
title('Trapeziumregel, eerste functie')
xlabel('h')
ylabel('integratiefout')

figure(2)
semilogy(h1, h1.^4, 'r');
hold
semilogy(h1,simpson_integratie_fout1)
title('Regel van Simpson, eerste functie')
xlabel('h')
ylabel('integratiefout')

% Tweede functie
uitkomst2 = 2 * atan(5);

trapezium_integratie_fout2 = zeros(1,100);
simpson_integratie_fout2 = zeros(1,100);
h2 = zeros(1,100);

for i=1:200
    n = i * 100;
    trapezium_integratie_fout2(i) = abs(uitkomst2 - trapezium(@func2,-5,5,n));
    simpson_integratie_fout2(i) = abs(uitkomst2 - simpson(@func2,-5,5,n));
    h2(i) = 10 / n;
end

figure(3)
semilogy(h2, h2.^2, 'r');
hold
semilogy(h2,trapezium_integratie_fout2)
title('Trapeziumregel, tweede functie')
xlabel('h')
ylabel('integratiefout')

figure(4)
semilogy(h2, h2.^4, 'r');
hold
semilogy(h2,simpson_integratie_fout2)
title('Regel van Simpson, tweede functie')
xlabel('h')
ylabel('integratiefout')

%% 1.2 Adaptieve routine

ewaarden = zeros(4,14);
for i=4:14
    ewaarden(i) = 10^(-i);
end

a = -5;
b = 5;

trapezium_tijden = zeros(4,14);
simpson_tijden = zeros(4,14);
quad_tijden = zeros(4,14);

for i=4:14
    trapezium_tijden(i) = calculateTime(@trapezium_adaptief, @func2, a, b, ewaarden(i));
    simpson_tijden(i) = calculateTime(@simpson_adaptief, @func2, a, b, ewaarden(i));
    quad_tijden(i) = calculateTime(@quad, @func2, a, b, ewaarden(i));
end

figure(5)
subplot(3,1,1)
semilogx(ewaarden,trapezium_tijden)
subplot(3,1,2)
semilogx(ewaarden,simpson_tijden)
subplot(3,1,3)
semilogx(ewaarden,quad_tijden)