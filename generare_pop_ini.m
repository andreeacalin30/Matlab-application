function [P] = generare_pop_ini(dim, p, m)
p_size=size(p);
m_size=size(m);
P=zeros(dim, 13);
i=1;
x=zeros(1, 12);
while i<=dim
    x=generare_x;
    if este_fezabil(x)      
       P(i,1:12)=x(1:12);
        P(i,13)=fitness(x, p, m);
        i=i+1;
    end
end
end

