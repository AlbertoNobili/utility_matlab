function [] =  meanFrequency(x, fs, window_size, noverlap)

% fs: sampling frequency
% window_size: lunghezza della finestra
% noverlap: ovrapposizione tra finestre

nfft = 2^nextpow2(window_size); % Numero di punti FFT

% Segmentazione manuale del segnale
step = window_size - noverlap; % Passo tra le finestre
num_windows = floor((length(x) - window_size) / step) + 1; % Numero di finestre

MF_vector = zeros(1, num_windows); % Preallocazione

for i = 1:num_windows
    idx_start = (i-1) * step + 1;
    idx_end = idx_start + window_size - 1;
    x_window = x(idx_start:idx_end); % Estrazione della finestra
    
    % Calcolo della PSD sulla finestra
    [pxx, f] = pwelch(x_window, window_size, noverlap, nfft, fs);
    
    % Calcolo della frequenza media per la finestra corrente
    MF_vector(i) = sum(f .* pxx) / sum(pxx);
end

% Creazione del vettore temporale
t = (0:num_windows-1) * step / fs;

% Plot della MF nel tempo
figure()
plot(t, MF_vector, '-o')
xlabel('Tempo (s)')
ylabel('Frequenza Media (Hz)')
title('Andamento della Frequenza Media nel Tempo')
grid on
