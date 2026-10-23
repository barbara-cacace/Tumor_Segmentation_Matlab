function f = extractFeatures(img)
    img = double(img);

    meanVal = mean(img(:));

    minVal = min(img(:));

    maxVal = max(img(:));

    stdVal = std(img(:));

    entropyVal = entropy(uint8(img)); 

    skewVal = skewness(img(:));

    kurtVal = kurtosis(img(:));

    edges = edge(uint8(img), 'Canny');
    edgeDensity = sum(edges(:)) / numel(edges);

    f = [meanVal, minVal, maxVal, stdVal, entropyVal, skewVal, kurtVal, edgeDensity];
end
