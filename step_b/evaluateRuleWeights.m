function error = evaluateRuleWeights(weights, fis, X, coordMap, mask)
    imageSize = size(mask);

    fisWeighted = fis;
    for i = 1:length(weights)
        fisWeighted.Rules(i).Weight = weights(i);
    end

    try
        [~, tumorMask] = fisSegmentation(fisWeighted, X, coordMap, imageSize);
        [dice, ~] = evaluateSegmentation(tumorMask, mask);
    catch
        dice = 0;
    end

    error = 1 - dice;
end