function [unique_a, b_avg] = uniqueSorted_and_average(a, b)

% Trova gli elementi unici in 'a' e la loro posizione
[unique_a, ~, indices] = unique(a);

% Calcola la media dei valori in 'b' corrispondenti agli elementi duplicati in 'a'
b_avg = arrayfun(@(x) mean(b(indices == x)), 1:numel(unique_a));

% Adatta la dimensione di b_avg alla forma di b
if iscolumn(b)
    b_avg = b_avg'; 
end
