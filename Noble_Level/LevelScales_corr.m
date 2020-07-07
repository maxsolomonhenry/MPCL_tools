clearvars

DbArray = getFolderRmsLevel("stims/", "aif");
AllMeanRankings = getAllMeanRankings();

NumScales = size(AllMeanRankings, 2);

Pearson_ = zeros(NumScales, 1);
pPearson = zeros(NumScales, 1);
Spearman_ = zeros(NumScales, 1);
pSpearman = zeros(NumScales, 1);

for Scale = 1:NumScales
    [Pearson_(Scale), pPearson(Scale)] = corr(DbArray, AllMeanRankings(:, Scale));
    [Spearman_(Scale), pSpearman(Scale)] = corr(DbArray, AllMeanRankings(:, Scale),...
        'type', 'Spearman');
end

figure();
stem(Pearson_); hold on; stem(pPearson); hold off; legend('Pearson \rho','p-value');

figure();
stem(Spearman_); hold on; stem(pSpearman); hold off; legend('Spearman \rho','p-value')

PearsMin = min(Pearson_);
PearsMax = max(Pearson_);

SpearMin = min(Spearman_);
SpearMax = max(Spearman_);

fprintf("Pearson range: %f to %f\n", PearsMin, PearsMax);
fprintf("Spearman range: %f to %f\n", SpearMin, SpearMax);