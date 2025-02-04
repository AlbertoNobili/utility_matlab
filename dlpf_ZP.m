function y = dlpf_ZP(x, f, T)

fs = 1/T;

dx = diff(x) * fs;
dx = [dx; dx(end,:)];

y = lpf_ZP(dx, f, T);

end


