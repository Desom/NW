function [ I ] = simpson( f, a, b, n )

l = (b-a) / n;
% se zijn de start- en eindpunten van de intervallen
se = zeros(1,n+1);
for i=0:n
    se(i+1) = a + i * l;
end

I = 0;
for i=1:n
    start = se(i);
    final = se(i+1);
    mid = (start + final)/2;
    
    I = I + ((final - start) / 6) * (f(start) + 4 * f(mid) + f(final));
end

end
