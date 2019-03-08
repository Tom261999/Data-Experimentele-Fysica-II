function [T,sT] = interpol(mV)
% mV is de input van de gemeten spanning van thermokoppel. De functie
% returned [T, sT] met T de temperatuur in kelvin, sT de fout op T. Voor de
% interpolatie veronderstellen we (m.b.v. benaderingen) een lineair verband
% tussen 2 gekende datapunten.

% dummy = [[1:5]',[exp(1:5)]']; % dummy was nodig om te testen op gekende
% data
load('datainterpol.mat')
data = [datainterpol(:,2),datainterpol(:,1)]; % Datamatrix: op data(:,1) zit de input in mV, op data(:,2) de output in K. + de kolommen wisselen, dit had ik opgefucked bij het ingeven van de data.
sT_gewoon = 1; % dit is de fout op mV in de gegeven data
sIn = 0.01; % dit is de fout op de input, in mV

plot( data(:,1) , data(:,2) ) % toont de data visueel, just for fun

if min( find( data(:,1) >= mV ) ) == max( find( data(:,1) <= mV ) )
    %Werk met de exacte waarde
    disp('De gegeven waarde zit in de dataset, geen interpolatie nodig')
    index = min( find( data(:,1) >= mV ) );
    T = data(index,2);
    sT = sT_gewoon;
    
else
    % Interpoleer tussen de dichtstbijzijnde waarden
    disp('De gegeven waarde zit niet in de dataset, interpolatie is nodig.')
    index_L = max( find( data(:,1) <= mV ) );
    index_U = min( find( data(:,1) >= mV ) );
    
    % Het voorschrift voor lineaire interpolatie tussen twee punten is:
    % y = ( y2 - y1 ) / ( x2 - x1 ) * ( x - x1 ) + y1
    x = mV;
    x1 = index_L;
    x2 = index_U;
    y1 = data(x1,2);
    y2 = data(x2,2);
    
    T = ( y2 - y1 ) ./ ( x2 - x1 ) .* ( x - x1 ) + y1;
    
    % Dan nu propagatie, deze nog eens nakijken! (op de bus propageren is
    % ver van ideaal!!)
    px = ( y2 - y1 ) ./ ( x2 - x1 );
    px1 = - ( y2 - y1 ) ./ ( x2 - x1 ) + ( x - x1 ) .* ( y2 - y1 ) ./ ( ( x2 - x1 ).^2 );
    px2 = ( x - x1 ) .* ( - ( y2 - y1 ) ./ ( ( x2 - x1 ).^2 ));
    py1 = ( x1 - x ) ./ ( x2 - x1 ) + 1;
    py2 = ( x - x1 ) ./ ( x2 - x1 ); 
    
    sT = sqrt( sIn.^2 .* ( px.^2 + px1.^2 + px2.^2 ) + sT_gewoon.^2 .* ( py1.^2 + py2.^2 ) );
    
end

end