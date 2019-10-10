function [] = generatia_urmatoare_produse(dim,MAX,pc,pm,eps,NrG,nr_pers)%numed imi incarca vectorul de costuri
%generatia_urmatoare_produse( 20,50,0.8,0.5,1e-5,10,nr_pers);

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
     % recombinare
     O1=recombinare_pop_produse(Pop,dim,pc,pret_unitate,nr_pers);
     O2=recombinare_pop_p2_unipunct(Pop,dim,pc,pret_unitate,nr_pers);
    
    %mutatie
       MO =  mutatie_pop_produse(dim, O2,pm,pret_unitate,nr_pers);
       MO1= mutatie_p2(dim, O2,pm,pret_unitate,nr_pers);
     fprintf('Generatia: %d\n', nrg);
   fprintf('Parinti: %5.2f  --     Recombinare uniforma : %5.2f  --   Recombinare unipunct : %5.2f \n',[Parinti(:, 3),O1(:, 3),O2(:,3)]);
   fprintf('Populatie copii:  %5.2f   --    Mutatia 1: %5.2f   --    Mutatia 2 : %5.2f\n',[O1(:, 3), MO(:, 3),MO1(:, 3)]);   
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

