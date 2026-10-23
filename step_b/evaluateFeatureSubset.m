function fitness = evaluateFeatureSubset(featureMask)

    data = load("features_for_GA.mat");
    X = data.X;
    y = data.y;
    coordMap = data.coordMap;
    mask = data.mask;
    imageSize = size(mask);

    featureMask = logical(round(featureMask(:)'));  

    if length(featureMask) ~= 8
        error("featureMask must contain 8 binary values.");
    end

    X_selected = zeros(size(X)); 

    for k = 1:8
        if featureMask(k)
            X_selected(:,k) = X(:,k);
        end
    end

    fis = readfis("TumorSegmentation.fis");

    try
        [tumorScore, tumorMask] = fisSegmentation(fis, X_selected, coordMap, imageSize);

        [dice, ~] = evaluateSegmentation(tumorMask, mask);
    catch ME
        warning("FIS failed for selected features. Defaulting to Dice = 0.\n%s", ME.message);
        dice = 0;
    end

    fitness = 1 - dice;
end
