function out = dlpf_butt(data, fc, Ts, order)
    % derivative_filter: Filtro derivativo con attenuazione del rumore
    %
    % Parametri:
    % x     - Segnale di input
    % fs    - tempo di campionamento (s)
    % fc    - Frequenza di taglio del filtro passa-basso (Hz)
    % order - Ordine del filtro passa-basso
    %
    % Output:
    % y     - Segnale filtrato (derivata smussata)
    
    out = zeros(size(data));
    
    for i = 1:size(data,2)
        
        x = data(:,i);
    
        if isrow(x)
            x = x';
        end
        
        fs = 1/Ts;
        
        % Normalizza la frequenza di taglio rispetto alla frequenza di Nyquist
        Wn = fc / (fs / 2);
        
        % Progetta un filtro passa-basso Butterworth
        [b, a] = butter(order, Wn, 'low');
        
        % Calcola la derivata numerica del segnale
        dx = diff(x) * fs;  % Derivata discreta moltiplicata per fs per compensare il passo temporale
        
        % Aggiungi un campione per mantenere la lunghezza del segnale
        dx =  [dx; dx(end)];
        
        % Applica il filtro passa-basso alla derivata per ridurre il rumore
        %     y = filtfilt(b, a, dx);  % filtfilt applica il filtro in modo bidirezionale per evitare distorsioni di fase
        y = filter(b, a, dx);  % filtfilt applica il filtro in modo bidirezionale per evitare distorsioni di fase
        
        out(:,i) = y;
    
    end
end
