function [ a, b ] = checkInfinite( f, a, b)
    
    while (f(a) == Inf)
        a = a + eps;
    end
    
    while (f(b) == Inf)
        b = b - eps;
    end
    
end

