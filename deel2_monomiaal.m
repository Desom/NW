[A, b] = stelsel_monomiaal(@func1, 20);

for i=1:n
    a = A(:i,:i)\b;
end