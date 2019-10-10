function [] = generatia_urmatoare(m,p,dim,MAX,pc,pm,eps,NrG)
%generatia_urmatoare('multiplier.txt','payment.txt', 20,50,0.8,0.5,1e-5,10);
p=load('payment.txt');
m=load('multiplier.txt');

Pop=generare_pop_ini(dim, p, m);
fitmax=max(Pop(:,13));
valori_max=[fitmax];
it=1;
nrg=0;
OK=1;
while it<=MAX && nrg<=NrG &&OK
    % selectie parinti
     Parinti=selectie_ruleta(Pop,dim);
     O1=recombinare_pop_p1_uniforma(Pop,dim,pc,p,m);
     O2=recombinare_pop_p1_unipunct(Pop,dim,pc,p,m);
     O3=recombinare_pop_p1_multipunct(Pop,dim,pc,p,m);
    %mutatie
       MO = mutatie_pop(dim, O1,pm, p, m);
       MO1 = mutatie_p1(dim, O1,pm, p, m);
      fprintf('Generatia: %d\n', nrg);
      fprintf('Parinti: %f  |  Recombinare uniforma : %f  |  Recombinare unipunct : %f  | Recombinare multipunct : %f\n',[Parinti(:, 13),O1(:, 13),O2(:, 13),O3(:, 13)]);
      fprintf('Populatie copii:  %f  |  Mutatia 1: %f  |  Mutatia 2 : %f\n',[O1(:, 13), MO(:, 13),MO1(:, 13)]);
       %selectia generatiei urmatoare
       GenUrm = elitism(Pop,MO,dim);
       % numararea generatiilor cosecutive cu cel mai bun individ
       fitmax_urm=max(GenUrm(:,13));
       fitmin=min(GenUrm(:,13));
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
 x=1:length(valori_max);
 y=12*(12-1)/2-valori_max(x);
  FID = fopen('valori1_grafic1.txt', 'w');
        if FID == -1, error('Cannot create file.'); end
    fprintf(FID, '%g  \n', x);
    fclose(FID);
    FID = fopen('valori2_grafic1.txt', 'w');
    if FID == -1, error('Cannot create file.'); end
    fprintf(FID, '%g  \n', y);
    fclose(FID);

% figure
% stem(Pop(:,end));

disp('Cel mai bun individ:');
 [val,poz]=max(Pop(:,13));
 sol=Pop(poz,1:12);
 disp(sol);
 FID = fopen('numarMuncitori.txt', 'w');
if FID == -1, error('Cannot create file.'); end
fprintf(FID, '%g %g %g %g %g %g %g %g %g %g %g %g \n', sol);
fclose(FID);
 disp(['Costul:' num2str(val)]);
end

