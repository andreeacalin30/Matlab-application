function [] = generatia_urmatoare_produse_test(dim,MAX,pc,pm,eps,NrG)%numed imi incarca vectorul de costuri
%generatia_urmatoare_produse_test( 20,50,0.8,0.5,1e-5,10);
n=load('numarMuncitori.txt');
nr_pers=n(1)+n(4)+n(7)+n(10);

pret_unitate=load('pret_unitate.txt');
Pop=generare_pop_produse(dim, pret_unitate,nr_pers);
fitmax=max(Pop(:,3));
valori_max=[fitmax];
it=1;
nrg=0;
OK=1;
while it<=MAX && nrg<=NrG &&OK
    % selectie parinti
     Parinti=selectie_ruleta_produse(Pop,dim);
     disp('Afisare parinti: ');
     disp(Parinti(:, 3));
     % recombinare
%       O=recombinare_pop_produse(Pop,dim,pc,pret_unitate,nr_pers);
%       disp('Afisare recombinare uniforma: ');
%       disp(O(:, 3));
       O2=recombinare_pop_p2_unipunct(Pop,dim,pc,pret_unitate,nr_pers);
       disp('Afisare recombinare unipunct: ');
      disp(O2(:, 3));
%      O3=recombinare_pop_p2_multipunct(Pop,dim,pc,pret_unitate,nr_pers);
%       disp('Afisare recombinare multipunct: ');
%       disp(O3(:, 3));
      %mutatie
%        MO =  mutatie_pop_produse(dim, O2,pm,pret_unitate,nr_pers);
        MO =  mutatie_p2(dim, O2,pm,pret_unitate,nr_pers);
       disp('Afisare copii mutati: ');
       disp(MO(:, 3));
       %selectia generatiei urmatoare
       GenUrm = elitism_produse(Pop,MO,dim);
       % numararea generatiilor cosecutive cu cel mai bun individ
       fitmax_urm=max(GenUrm(:,3));
       fitmin=min(GenUrm(:,3));
       OK= fitmin~=fitmax_urm;
       if abs(fitmax-fitmax_urm)<eps%valorile fitnessurilor sa fie aproximativ egale
           %sa difere doar prin diferenta epsilon
           nrg=nrg+1;
       else
           nrg=0;
       end
       fitmax=fitmax_urm;
       valori_max=[valori_max fitmax];
       it=it+1;
       Pop=GenUrm;
end;
disp('Cel mai bun individ:');
 [val,poz]=max(Pop(:,3));
 sol=Pop(poz,1:2);
 disp(sol);
 solution=Pop(poz,1:3);
 dlmwrite('numarOptimProductie.txt',solution); 
 disp(['Costul:' num2str(val)]);
end
