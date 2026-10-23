function [X, y, coordMap] = extractFeaturesB(img, mask, winSize)

    assert(mod(winSize, 2) == 1, 'Window size must be odd');
    halfWin = floor(winSize / 2);
    [rows, cols] = size(img);

    paddedImg  = padarray(double(img),  [halfWin, halfWin], 'symmetric');
    paddedMask = padarray(mask,         [halfWin, halfWin], 'symmetric');

    X = [];
    y = [];
    coordMap = []; % stores each feature's vector, which is useful for feature extraction

    for i = 1 + halfWin : rows + halfWin
        for j = 1 + halfWin : cols + halfWin
            patch = paddedImg(i - halfWin : i + halfWin, j - halfWin : j + halfWin);
            patchVec = patch(:);

            centerIntensity = paddedImg(i, j);
            localMean    = mean(patchVec);
            localStd     = std(patchVec);
            localEntropy = entropy(uint8(patch * 255));
            localSkew    = skewness(patchVec);
            localKurt    = kurtosis(patchVec);
            localRange   = max(patchVec) - min(patchVec);
            localEnergy  = sum(patchVec .^ 2);

            features = [centerIntensity, localMean, localStd, localEntropy, ...
                        localSkew, localKurt, localRange, localEnergy];

            X = [X; features];
            y = [y; paddedMask(i, j) > 0];
            coordMap = [coordMap; i - halfWin, j - halfWin];
        end
    end
end
