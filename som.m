function mapa = som(vetores,q_c,q_epochs,axes)
[L C] = size(vetores);
matrix = inicializa_pesos(L,q_c);
radius = 1;
final_alfa = 0.01;
alfa = 0.6;
dec = (final_alfa/alfa)^(1/(q_epochs-1));
mapa = cell(1,q_epochs);
epoch = 2;
mapa{1} = matrix;
[x y] = show_mapa(matrix);
if nargin > 3
    hpl = plot(axes,x,y,'-*','YDataSource','y','XDataSource','x');
else
    hpl = plot(x,y,'-*','YDataSource','y','XDataSource','x');
end
while(true)
    for i = 1:C
        vetor = vetores(:,i);
        index = get_least_distance(matrix,vetor);
        if q_c > 3
            begin = index - radius;
            if begin < 1
                begin = 1;
            end
            final = index + radius;
            if final > q_c
                final = q_c;
            end
            matrix(:,begin:final) = matrix(:,begin:final) + alfa.*(vetor(:,ones(1,final-begin+1)) - matrix(:,begin:final));
        else
            matrix(:,index) = matrix(:,index) + alfa.*(vetor - matrix(:,index));
        end
            
    end
    [x y] = show_mapa(matrix);
    refreshdata(hpl,'caller');
    drawnow; pause(.01);
    mapa{epoch} = matrix;
    epoch = epoch + 1;
    alfa = update_alfa(alfa, dec);
    if(alfa <= final_alfa)
        break;
    end
end

