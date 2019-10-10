function [q] =FPS(Pop,dim)
q=zeros(1,dim);
fitnesst=sum(Pop(:,13));
p=Pop(:,13)/fitnesst;
q(1)=p(1);
for i=2:dim
    q(i)=q(i-1)+p(i);
end
end

