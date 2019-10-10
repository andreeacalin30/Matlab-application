function [P] = generare_pop_produse(dim, pret_unitate,nr_pers)

P=zeros(dim, 3);
i=1;
x=zeros(1, 2);
while i<=dim
    x=generare_x_produse;
    if este_fezabil_produse(x,nr_pers)      
       P(i,1:2)=x(1:2);
        P(i,3)=fitness_produse(x, pret_unitate,nr_pers);
        i=i+1;
    end
end
end
