A1 = 1;
A2 = 0.1;
f1 = 1;
f2 = 100;
C = 0;

f_cut = 10;

t_1 = 0;
t_2 = 2;
Ts = 0.0001;

x = t_1:Ts:t_2;
y = C + A1*sin(2*pi*f1*x) + A2*sin(2*pi*f2*x);

y_hpf = hpf(y, f_cut, Ts);
y_lpf = lpf(y, f_cut, Ts);
y_hpf_zp = hpf_ZP(y, f_cut, Ts);
y_lpf_zp = lpf_ZP(y, f_cut, Ts);

figure()
stairs(x,y)
grid on; grid minor; hold on;
stairs(x, y_hpf);
stairs(x, y_lpf);
xlabel('time [s]')
legend('original', 'hpf', 'lpf')
title('Classical filters');

figure()
stairs(x,y)
grid on; grid minor; hold on;
stairs(x, y_hpf_zp);
stairs(x, y_lpf_zp);
xlabel('time [s]')
legend('original', 'hpf zp', 'lpf zp')
title('Zero phase filters')
