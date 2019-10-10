function [Parinti] = selectie_ruleta(Populatie,dim)
vector_prob=FPS_sigma_scalarea(Populatie,dim);
Parinti=zeros(dim,13);
for i=1:dim
    r=unifrnd(0,1);
    j=1;
    while vector_prob(j)<r
        j=j+1;
    end
    Parinti(i,:)=Populatie(j,:);
end
end

