function [ I ] = trapezium_adaptief( f, a, b, e, counter)

if (nargin < 5)
    counter = 1;
else
    counter = counter + 1;
end

[a, b] = checkInfinite(f,a,b);

I1 = trapezium(f,a,b,1);
I2 = trapezium(f,a,b,2);

if (I1 - I2 < e && counter > 10)
    I = I2;
else
    I = trapezium_adaptief(f,a,(a+b)/2,e,counter) + trapezium_adaptief(f,(a+b)/2,b,e,counter);

end

end