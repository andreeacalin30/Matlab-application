function [OM] = mutatie_pop(dim, O,pm, p, m)
OM=O;
OK=0;
for i=1:dim
    pop=OM(i,1:12);
    for j=1:12
        r=unifrnd(0, 1);
        if r<=pm
            %pop(j)=mutatie_fluaj(pop(j), 0.15);   
            %in functie de pozitia alelelei
           % disp('Mutatie efectuata in cromozomul:');
          % disp(O(i, :));
           %disp('gena:');
          % disp(j);
           %fac mutatie fluaj; generez 0 sau 1
            if j==1 || j==2 ||j==3
              
                   pop(j)=unidrnd(10);
               
            else
                if j==4 || j==5 ||j==6
                    
                   pop(j)=unidrnd(20);
                    
                else                
                     if j==7 || j==8 ||j==9 || j==10 ||j==11 || j==12
                            
                             pop(j)=unidrnd(15);
                                                    
                     end
                end
        
          
            end
            if este_fezabil(pop)
                
                OM(i, 1:12)=pop;
                OM(i, 13)=fitness(pop,p,m);
                pop=OM(i, 1:12);
              % disp('Cromozom rezultat:');
              % disp(OM(i, :));
            end
          end
        end
    end
end

