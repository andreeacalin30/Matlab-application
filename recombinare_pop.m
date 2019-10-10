function [O] =recombinare_pop(P,dim,pc,p,m)
O=P;
copii=zeros(2,12);
for i=1:2:dim-1
    p1=P(i,1:12);
    p2=P(i+1,1:12);
    r=unifrnd(0,1);
    if r<=pc
        %[copii(1,:),copii(2, :)]=recombinare_uniforma_p1(p1,p2);
        [copii(1,:),copii(2, :)]=recombinare_unipunct_p1(p1,p2,12);
        %[copii(1,:),copii(2, :)]=recombinare_multip_p1(p1,p2,12);
            if este_fezabil(copii(1, :))
                O(i, 1:12)=copii(1, :);
                O(i,13)=fitness(copii(1,:),p,m);
            else
                if este_fezabil(copii(2,:))
                O(i+1, 1:12)=copii(2,:);
                O(i+1,13)=fitness(copii(2,:),p,m);
                end
                
            end
    end
     
end
         
end

