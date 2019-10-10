function [Pop_urm] =elitism(Pop_curenta,Copii,dim)
m=13;
Pop_urm=Copii;
[val1,i1]=max(Pop_curenta(:,m));
[val2,~]=max(Copii(:,m));
if(val1>val2)
    cel_mai_bun=Pop_curenta(i1,:);
    pozitie=unidrnd(dim);
    Pop_urm(pozitie,:)=cel_mai_bun;% aici cel mai bun individ este salvat in populatia urmatoare
end
end
