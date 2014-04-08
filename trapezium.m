function [ I ] = trapezium( f, a, b, n )

l = (b-a) / n;

startpunten = zeros(1,n+1);
for i=0:n
    startpunten(i+1) = a + i * l;
end

I = 0;
for i=1:n
    I = I + oppervlakteTrapezium(l,f(startpunten(i)),f(startpunten(i+1)));
end

end

function [Opp] = oppervlakteTrapezium(h, a, b)
    Opp = (h * (a + b)) / 2;
end