%% Deel 1

n = 20;
[ A, b ] = stelsel_monomiaal(@func1, n);

e = zeros(1,n);
for i=1:n
    a = A(1:i,1:i)\b(1:i);
    func = @(x) (func1(x) - polyval(flipud(a),x)) .^2;
    e(i) = sqrt(quad(func, -1, 1, 1e-8));
end

semilogy(e)

%% Deel 2

n = 20;
[ A, b ] = stelsel_monomiaal(@func1, n);
[ Aster, bster ] = stelsel_monomiaal_exp(n);

e_a = zeros(n);
e_b = zeros(n);
e_A = zeros(n);
for i=1:n
    a = A(1:i,1:i)\b(1:i);
    aster = Aster(1:i,1:i)\bster(1:i);
    e_a(i) = norm(a - aster) / norm(aster);
    e_b(i) = norm(b(1:i) - bster(1:i)) / norm(bster(1:i));
    e_A(i) = norm(A(1:i) - Aster(1:i)) / norm(Aster(1:i));
end

figure
subplot(3,1,1)
semilogy(e_b)
subplot(3,1,2)
semilogy(e_A)
subplot(3,1,3)
semilogy(e_a)