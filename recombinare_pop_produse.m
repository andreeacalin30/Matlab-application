function [O] =recombinare_pop_produse(P,dim,pc,pret_unitate,nr_pers)
O=P;
copii=zeros(2,2);
for i=1:2:dim-1
    p1=P(i,1:2);
    p2=P(i+1,1:2);
    r=unifrnd(0,1);
    if r<=pc
        [copii(1,:),copii(2, :)]=recombinare_uniforma_produse(p1,p2);
            if este_fezabil_produse(copii(1, :),nr_pers)
                O(i, 1:2)=copii(1, :);
                O(i,3)=fitness_produse(copii(1,:),pret_unitate,nr_pers);
            else
                if este_fezabil_produse(copii(2,:),nr_pers)
                O(i+1, 1:2)=copii(2,:);
                O(i+1,3)=fitness_produse(copii(2,:),pret_unitate,nr_pers);
                end
            end
    end
end
end

