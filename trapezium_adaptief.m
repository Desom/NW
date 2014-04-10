function [ I ] = trapezium_adaptief( f, a, b, e )

fprintf('1');

I1 = trapezium(f,a,b,1);
I2 = trapezium(f,a,b,2);

if (I1 - I2 < e)
    I = I2;
else
    I = trapezium_adaptief(f,a,(a+b)/2,e) + trapezium_adaptief(f,(a+b)/2,b,e);

end

