%% 1.1 Vast deelinterval

integratie_fout1 = zeros(1,100);
h = zeros(1,100);

uitkomst1 = exp(1) - exp(-1);
uitkomst2 = 2 * atan(5);

for i=1:100
    integratie_fout1(i) = abs(uitkomst1 - trapezium(@func1,-1,1,i * 100));
    h(i) = 2 / i;
end

figure(1)
semilogy(h,integratie_fout1)

integratie_fout2 = zeros(1,100);
for i=1:100
    integratie_fout2(i) = abs(uitkomst1 - simpson(@func1,-1,1,i * 100));
    
end
figure(3)
semilogy(h, integratie_fout2)

for i=1:100
    integratie_fout1(i) = abs(uitkomst2 - trapezium(@func2,-5,5,i * 100));
    h(i) = 10 / i;
end

figure(4)
semilogy(h,integratie_fout1)

integratie_fout2 = zeros(1,100);
for i=1:100
    integratie_fout2(i) = abs(uitkomst2 - simpson(@func2,-5,5,i * 100));
    
end
figure(2)
semilogy(h,integratie_fout2)

%% 1.2 Adaptieve routine