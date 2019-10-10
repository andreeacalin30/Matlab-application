function [OM] = mutatie_p2(dim, O,pm,pret_unitate,nr_pers)
OM=O;
OK=0;
for i=1:dim
    pop=OM(i,1:2);
    for j=1:2
        r=unifrnd(0, 1);
        if r<=pm
%            disp(O(i, :));
%            disp('gena:');
%            disp(j);
           %fac mutatie fluaj; generez 0 sau 1
           coef=unidrnd(2)-1;
           if coef==1
               pop(j)=pop(j)+1;
           else
               pop(j)=pop(j)-1;
           end;
           
          if j==1 
              if pop(j)>15
                  pop(j)=15;
              else if pop(j)<1
                    pop(j)=1;   
                  end
              end;
          else 
              if pop(j)>30
                  pop(j)=30;
              else if pop(j)<1
                    pop(j)=1;   
                  end
             end;
              
                                                    
          end
        end
        
    end
            if este_fezabil_produse(pop,nr_pers)
                
                OM(i, 1:2)=pop;
                OM(i, 3)=fitness_produse(pop,pret_unitate,nr_pers);
                pop=OM(i, 1:2);
              % disp('Cromozom rezultat:');
             %  disp(OM(i, :));
            end
 end
 end
    

