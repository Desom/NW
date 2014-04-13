function [ t ] = calculateTime( methode, f, a, b, e )

total = 0;
for i=1:10
    tic;
    methode(f,a,b,e);
    total = total + toc;
end

t = total / 10;

end

