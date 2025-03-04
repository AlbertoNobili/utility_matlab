function y = bpf_butt_ZP(x, low_cut, high_cut, dt, order)

fs = 1/dt;
[b, a] = butter(order, [low_cut, high_cut] / (fs/2), 'bandpass');
y = filtfilt(b, a, x);