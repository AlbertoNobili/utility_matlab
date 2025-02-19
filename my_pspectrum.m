function [] = my_pspectrum(x, dt)

fs = 1/dt;             % Sample frequency (samples per unit of time)
n = length(x);         % Number of samples
df = fs/n;	           % Frequency increment
y = fft(x);            % Discrete Fourier Transform of data (DFT)
y0 = fftshift(y);         % shift y values
f0 = (-n/2:n/2-1)*(df); % 0-centered frequency range
power0 = abs(y0).^2/(n);    % 0-centered power
% power0_dB = 20*log10(power0);
power0_dB = pow2db(power0);
figure()
plot(f0,power0_dB)
xlabel('Frequency')
ylabel('Power Spectrum')
grid on
grid minor

