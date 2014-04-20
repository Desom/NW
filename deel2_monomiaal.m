n = 20;
[A, b] = stelsel_monomiaal(@func1, n);

e = zeros(1,n);
for i=1:n
    a = A(1:i,1:i)\b(1:i);
    func = @(x) (func1(x) - polyval(fliplr(a),x)) .^ 2;
    e(i) = sqrt(quad(func, -1, 1, 1e-8));
end

plot(e)