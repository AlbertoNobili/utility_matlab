% Vettori di input
a = [1; 3; 2; 2; 1; 4]; % Vettore colonna
b = [10; 20; 30; 40; 50; 60]; % Vettore colonna (potrebbe anche essere riga)

[unique_a, b_avg] = uniqueUnsorted_and_average(a, b);

% Output
disp('Vettore a unicizzato:');
disp(unique_a);

disp('Vettore b mediato:');
disp(b_avg);
