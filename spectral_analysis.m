function [] = spectral_analysis(x, dt)

%% Notes
% 1) The DFT of a time-domain signal has a periodic nature, where the first
% half of its spectrum is in positive frequencies and the second half is in
% negative frequencies.
% 2) For real signals, the fft spectrum is a two-sided spectrum, where the
% spectrum in the positive frequencies is the complex conjugate of the
% spectrum in the negative frequencies.
% 3) The fft includes a scaling factor L=length(x)=length(fft(x)) between
% the original and the transformed signal.

%% Other matlab functions:
% - spectrogram: frequency analysis of non stationary signals (power
% spectrum evolution with time)
% - pspectrum: frequency analysis of both stationary and non stationary
% signals (computes both power spectrum and spectrogram)
% - periodogram: psd estimate (periodogram is what a psd estimate is called
% for time limited signals)
% - pwelch: alternative psd estimate

%% Code
fs = 1/dt;             % Sample frequency
n = length(x);         % Number of samples
df = fs/n;	           % Frequency increment

f = (0:n-1)*df;             % Frequency range
f0 = f-n/2; 

y = fft(x);                 % Discrete Fourier Transform (DFT)
y0 = fftshift(y);                           

ampl  = abs(y)/n;           % Amplitude spectrum  
ampl0 = abs(y0)/n;

power  = abs(y).^2/n;       % Power spectrum 
power0 = abs(y0).^2/n;      

psd  = abs(y).^2/(n*fs);    % Power Spectral Density
psd0 = abs(y0).^2/(n*fs);

% Single-sided amplitude spectrum
ampl_ss = 1/n * [abs(y(1)), 2*abs(y(2:end/2+1)), abs(y(end/2+1))];
f_ss = df*(0:(n-1)/2);

    
figure()
plot(f0,ampl0)
xlabel('Frequency [Hz]')
ylabel('|y(f)| / N\_sample')
title('Amplitude Spectrum')
grid on
grid minor

figure()
plot(f0,power0)
xlabel('Frequency [Hz]')
ylabel('|y(f)|^2 / N\_sample')
title('Power Spectrum')
grid on
grid minor

figure()
plot(f0,mag2db(psd0))
xlabel('Frequency [Hz]')
ylabel('PSD [dB/Hz]')
title('Power Spectral Density')
grid on
grid minor

figure()
plot(f_ss,ampl_ss)
xlabel('Frequency [Hz]')
title('Single-sided Amplitude Spectrum')
grid on
grid minor
    
