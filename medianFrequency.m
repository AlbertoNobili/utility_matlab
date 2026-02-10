function [t, MDF] =  medianFrequency(x, fs, window_size, noverlap, plot_flag)

% fs: sampling frequency
% window_size: length of each window
% noverlap: length of overlapping between windows

% Signal segmentation parameters
step = window_size - noverlap;        % step between windows
num_windows = floor((length(x) - window_size) / step) + 1; % num of windows

% Mean frequency vector computation
MDF = zeros(1, num_windows);
for i = 1:num_windows
    idx_start = (i-1) * step + 1;
    idx_end = idx_start + window_size - 1;
    % window extraction
    x_window = x(idx_start:idx_end); 
    % Compute PSD on the window
    [pxx, f] = pwelch(x_window, [], [], [], fs);
    % Plot PSD
%     figure()
%     plot(f,pxx)
%     xlabel('freq (Hz)');
%     title('psd');
    % Compute MDF for the window
    Pcum = cumsum(pxx);
    idx = find(Pcum >= Pcum(end)/2, 1);
    MDF(i) = f(idx);
end

% Time vector creation
t = step/(2*fs) + (0:num_windows-1) * step/fs;

% Plot result
if plot_flag == true
    figure()
    plot(t, MDF, '-o')
    xlabel('Tempo (s)')
    ylabel('Frequenza Media (Hz)')
    title('Andamento della Frequenza Media nel Tempo')
    grid on
end