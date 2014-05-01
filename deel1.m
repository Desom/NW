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
title('Trapeziumregel, Integraal 1')
xlabel('h')
ylabel('integratiefout')
legend('O(h^2)', 'Berekende integratiefout', 'Location', 'SouthEast')

figure(2)
semilogy(h1, h1.^4, 'r');
hold
semilogy(h1,simpson_integratie_fout1)
title('Regel van Simpson, Integraal 1')
xlabel('h')
ylabel('integratiefout')
legend('O(h^4)', 'Berekende integratiefout', 'Location', 'SouthEast')

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
title('Trapeziumregel, Integraal 2')
xlabel('h')
ylabel('integratiefout')
legend('O(h^2)', 'Berekende integratiefout', 'Location', 'SouthEast')

figure(4)
semilogy(h2, h2.^4, 'r');
hold
semilogy(h2,simpson_integratie_fout2)
title('Regel van Simpson, Integraal 2')
xlabel('h')
ylabel('integratiefout')
legend('O(h^4)', 'Berekende integratiefout', 'Location', 'SouthEast')

%% 1.2 Adaptieve routine (a)

uitkomst1 = exp(1) - exp(-1);
uitkomst2 = 2 * atan(5);

rel_trap1 = abs(uitkomst1 - trapezium_adaptief_oud(@func1, -1, 1, 1e-8)) / uitkomst1;
rel_trap2 = abs(uitkomst2 - trapezium_adaptief_oud(@func2, -5, 5, 1e-8)) / uitkomst2;

rel_simp1 = abs(uitkomst1 - simpson_adaptief_oud(@func1, -1, 1, 1e-8)) / uitkomst1;
rel_simp2 = abs(uitkomst2 - simpson_adaptief_oud(@func2, -5, 5, 1e-8)) / uitkomst2;

fprintf('\nRelatieve fout van de trapezium adaptief:\n')
fprintf('Functie 1: %e\n', rel_trap1)
fprintf('Functie 2: %e\n', rel_trap2)
fprintf('Relatieve fout van Simpson adaptief:\n')
fprintf('Functie 1: %e\n', rel_simp1)
fprintf('Functie 2: %e\n', rel_simp2)

%% 1.2 (b)

uitkomst3 = 1;

rel_trap3 = abs(uitkomst3 - trapezium_adaptief_oud(@func3, -1, 1, 1e-8)) / uitkomst3;
rel_simp3 = abs(uitkomst3 - simpson_adaptief_oud(@func3, -1, 1, 1e-8)) / uitkomst3;

fprintf('\nRelatieve fout van de trapezium adaptief:\n')
fprintf('Functie 3: %e\n', rel_trap3)
fprintf('Relatieve fout van Simpson adaptief:\n')
fprintf('Functie 3: %e\n', rel_simp3)

%% 1.2 (c)

uitkomst4 = 2;

try
    rel_trap4 = abs(uitkomst4 - trapezium_adaptief_oud(@func4, 0, 1, 1e-8)) / uitkomst4;
    fprintf('\nRelatieve fout van de trapezium adaptief:\n')
    fprintf('Functie 4: %e\n', rel_trap4)
catch err
    fprintf('\nTrapezium adaptief caused an error.\n')
end
try
    rel_simp4 = abs(uitkomst4 - simpson_adaptief_oud(@func4, 0, 1, 1e-8)) / uitkomst4;
    fprintf('Relatieve fout van Simpson adaptief:\n')
    fprintf('Functie 4: %e\n', rel_simp4)
catch err
    fprintf('Simpson adaptief caused an error.\n')
end

%% 1.2 (c) vervolg

uitkomst4 = 2;

rel_trap4 = abs(uitkomst4 - trapezium_adaptief(@func4, 0, 1, 1e-8)) / uitkomst4;
rel_simp4 = abs(uitkomst4 - simpson_adaptief(@func4, 0, 1, 1e-8)) / uitkomst4;

fprintf('\nRelatieve fout van de trapezium adaptief (nieuw):\n')
fprintf('Functie 4: %e\n', rel_trap4)
fprintf('Relatieve fout van Simpson adaptief (nieuw):\n')
fprintf('Functie 4: %e\n', rel_simp4)

%% 1.2 (d)

ewaarden = zeros(1,10);
for i=1:10
    ewaarden(i) = 10^(-i);
end

a = -5;
b = 5;

trapezium_tijden = zeros(1,10);
simpson_tijden = zeros(1,10);
quad_tijden = zeros(1,10);

for i=1:10
    trapezium_tijden(i) = calculateTime(@trapezium_adaptief, @func2, a, b, ewaarden(i));
    simpson_tijden(i) = calculateTime(@simpson_adaptief, @func2, a, b, ewaarden(i));
    quad_tijden(i) = calculateTime(@quad, @func2, a, b, ewaarden(i));
end

figure(5)
subplot(3,1,1)
semilogx(ewaarden,trapezium_tijden)
title('Tijdsmeting trapezium adaptief')
xlabel('e')
ylabel('Tijd (s)')
ylim([0,0.8])
subplot(3,1,2)
semilogx(ewaarden,simpson_tijden)
title('Tijdsmeting simpson adaptief')
xlabel('e')
ylabel('Tijd (s)')
ylim([0,0.2])
subplot(3,1,3)
semilogx(ewaarden,quad_tijden)
title('Tijdsmeting quad')
xlabel('e')
ylabel('Tijd (s)')