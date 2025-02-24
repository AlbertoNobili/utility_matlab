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
% - spectrogram: frequency analysis of non stationary signals (spectrogram is a visual representation of the
% spectrum of frequencies as the signal evolve with time)
% - pspectrum: frequency analysis of both stationary and non stationary
% signals (computes both power spectrum and spectrogram)
% - periodogram: psd estimate (periodogram is what a psd estimate is called
% for time limited signals)
% - pwelch: alternative psd estimate

%% Code
fs = 1/dt;             % Sample frequency
n = length(x);         % Number of samples
df = fs/n;	           % Frequency increment

% Double-sided spectra
f = (0:n-1)*df;             % Frequency range
f0 = f - n/2*df; 

y = fft(x);                 % Discrete Fourier Transform (DFT)
y0 = fftshift(y);                           

ampl  = abs(y)/n;           % Amplitude spectrum  
ampl0 = abs(y0)/n;

power  = ampl.^2;           % Power spectrum 
power0 = ampl0.^2;      

psd  = power*(n/fs);        % Power Spectral Density
psd0 = power0*(n/fs);

% Single-sided spectra
f_ss = df*(0:floor(n/2)+1);
ampl_ss  = [ ampl(1),  2*ampl(2:floor(end/2)+1),  ampl(floor(end/2)+1)];
power_ss = [power(1), 2*power(2:floor(end/2)+1), power(floor(end/2)+1)];
psd_ss   = [  psd(1),   2*psd(2:floor(end/2)+1),   psd(floor(end/2)+1)];

% Plot results

figure()
plot(f0,ampl0)
xlabel('Frequency [Hz]')
title('Amplitude Spectrum')
grid on
grid minor

figure()
plot(f0,power0)
xlabel('Frequency [Hz]')
title('Power Spectrum')
grid on
grid minor

figure()
plot(f0,mag2db(psd0))
xlabel('Frequency [Hz]')
ylabel('PSD [db/Hz]')
title('Power Spectral Density')
grid on
grid minor

figure()
plot(f_ss,ampl_ss)
xlabel('Frequency [Hz]')
title('Single-sided Amplitude Spectrum')
grid on
grid minor

figure()
plot(f_ss,power_ss)
xlabel('Frequency [Hz]')
title('Single-sided Power Spectrum')
grid on
grid minor

figure()
plot(f_ss, mag2db(psd_ss))
xlabel('Frequency [Hz]')
ylabel('PSD [db/Hz]')
title('Single-sided Power Spectral Density')
grid on
grid minor

