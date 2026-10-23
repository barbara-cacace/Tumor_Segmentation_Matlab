function [dice, iou] = evaluateSegmentation(predMask, groundTruthMask)
    pred = predMask(:);
    gt   = groundTruthMask(:);

    intersection = sum(pred & gt);
    dice = 2 * intersection / (sum(pred) + sum(gt) + eps);

    unionArea = sum(pred | gt);
    iou = intersection / (unionArea + eps);
end
