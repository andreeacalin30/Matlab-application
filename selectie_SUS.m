function [Parinti] = selectie_SUS(Populatie,dim)
q=FPS_sigma_scalarea(Populatie,dim);
Parinti=zeros(dim,13);
k=1;
i=1;
r=unifrnd(0,1/dim);
while(k<=dim)
    while(r<q(i))
        Parinti(k, :)=Populatie(i, :); 
        r=r+1/dim;
        k=k+1;
    end
    i=i+1;
end
end






