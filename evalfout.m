function [ e ] = evalfout( f, a, x )

fs = f(x);
gs = polyval(fliplr(a), x);

e = sum(fs - gs);

end

