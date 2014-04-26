function [ A, b ] = stelsel_monomiaal( f, n )

A = zeros(n);
for i=1:n+1
    for j=1:n+1
        if (mod(i + j - 2, 2) == 1)
            A(i,j) = 0;
        else
            func = @(x) x.^(i + j - 2);
            A(i,j) = quad(func, -1, 1, 1e-8);
        end
    end
end

b = zeros(n,1);
for i=1:n+1
    func = @(x) x.^(i-1) .* f(x);
    b(i) = quad(func, -1, 1, 1e-8);
end

end