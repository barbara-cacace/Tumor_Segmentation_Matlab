function [tumorScoreMap, tumorMask] = fisSegmentation(fis, X, coordMap, imageSize)

    clipRanges = {
        [0 1];     % Intensity
        [0 1];     % Mean
        [0 0.4];   % StdDev
        [0 5];     % Entropy
        [-4 5];    % Skewness
        [1 25];    % Kurtosis
        [0 1];     % Range
        [0 30];    % Energy
    };

    for k = 1:size(X,2)
        range = clipRanges{k};
        X(:,k) = min(max(X(:,k), range(1)), range(2));
    end

    tumorScores = evalfis(fis, X);
    tumorScores = min(max(tumorScores, 0), 1); 

    rows = imageSize(1);
    cols = imageSize(2);
    tumorScoreMap = zeros(rows, cols);

    for k = 1:size(coordMap, 1)
        r = coordMap(k, 1);
        c = coordMap(k, 2);
        tumorScoreMap(r, c) = tumorScores(k);
    end

    tumorMask = tumorScoreMap > 0.5;
end

