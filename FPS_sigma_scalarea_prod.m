function [q] = FPS_sigma_scalarea_prod(Populatie, dim)
fitness=Populatie(:, 3);
m=mean(fitness);
s=std(fitness);
fitness_nou=fitness;
for i=1:dim
    fitness_nou(i)=max(0,fitness(i)-(m-2*s));
end
fitness_total=sum(fitness_nou);
p=fitness_nou/fitness_total;

q=zeros(1,dim);
q(1)=p(1);
for i=2:dim
    q(i)=q(i-1)+p(i);
end
end
