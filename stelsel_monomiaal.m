function [ A, b ] = stelsel_monomiaal( f, n )

A = zeros(n);
for i=1:n
    for j=1:n
        func = @(x) x.^((i-1)+(j-1));
        A(i,j) = quad(func, -1, 1, 1e-8);
    end
end

b = zeros(n,1);
for i=1:n
    func = @(x) x.^(i-1) .* f(x);
    b(i) = quad(func, -1, 1, 1e-8);
end

end

