function [ I ] = simpson( f, a, b, n )

l = (b-a) / n;
% se zijn de start- en eindpunten van de intervallen
se = zeros(1,n+1);
for i=0:n
    se(i+1) = a + i * l;
end

I = 0;
for i=1:n
    mid = (se(i) + se(i+1))/2;
    I = I + ((se(i+1) - se(i)) / 6) * (f(se(i)) + 4 * f(mid) + f(se(i+1)));
end

end
