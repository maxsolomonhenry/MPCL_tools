function AllMeanRankings = getAllMeanRankings()
    DataFrame = load('data___.txt') ;
    
    AllMeanRankings = zeros(40, 23);

    for SemanticScale = 0:22
        AllSubjects = DataFrame(3:end,(1:38) + 38 * SemanticScale);
        MeanRankingPerStim = mean(AllSubjects, 2);

        %   Cols: Semantic scale
        %   Rows: Stimulus number
        AllMeanRankings(:, SemanticScale+1) =  MeanRankingPerStim;
    end