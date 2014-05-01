function [ I ] = trapezium_adaptief_oud( f, a, b, e, counter)

if (nargin < 5)
    counter = 1;
else
    counter = counter + 1;
end

I1 = trapezium(f,a,b,1);
I2 = trapezium(f,a,b,2);

if (I1 - I2 < e)
    I = I2;
    fprintf('Trapezium adaptief deed %d iteratie(s).\n', counter)
else
    I = trapezium_adaptief_oud(f,a,(a+b)/2,e,counter) + trapezium_adaptief_oud(f,(a+b)/2,b,e,counter);

end

end