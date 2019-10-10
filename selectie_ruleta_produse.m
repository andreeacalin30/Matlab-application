function [Parinti] = selectie_ruleta_produse(Populatie,dim)
vector_prob=FPS_sigma_scalarea_prod(Populatie,dim);
Parinti=zeros(dim,3);
for i=1:dim
    r=unifrnd(0,1);
    j=1;
    while vector_prob(j)<r
        j=j+1;
    end
    Parinti(i,:)=Populatie(j,:);
end
end

