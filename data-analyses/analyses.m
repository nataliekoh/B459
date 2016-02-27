%% load the data

% Make sure working directory is set as B419 folder.
file = readtable('data/all_condensed_v3.csv');

%% basic descriptions
% col = desc
% 2 = year
% 3 = # of TB
% 4 = TB patients with known HIV status (%)
% 5 = TB patients (tested) that are HIV-positive (%)
% 6 = HIV + TB patients on CPT (%)
% 7 = HIV + TB patients on ART (%)
% 24 = Pop (thousands)
% 25 = Pop under 15 (%)
% 26 = Pop over 60 (%)

unique_countries = unique(file(:, 1));

%% TB prevalence calculator
% will probably move into function 

figure;
title('TB prevalence (# of TB patients/population)');
xlabel('Year');
ylabel('% of population with TB');
hold on;

n_countries = 10;
for i = 1:n_countries
    country_name = unique_countries{i, 1};
    
    country_indices = find(strcmp(file{:, 1}, country_name) == 1);
    years = file{country_indices, 2};
    nTB_per_pop = file{country_indices, 3} ./ file{country_indices, 24};
    
    plot(years, nTB_per_pop, '.-');
end;

legend(unique_countries{1:n_countries, 1});