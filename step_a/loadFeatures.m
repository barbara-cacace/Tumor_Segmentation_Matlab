function [features, labels] = loadFeatures(basePath, setType)

    categories = {'glioma', 'meningioma', 'pituitary', 'notumor'};
    features = [];
    labels = [];

    for i = 1:length(categories)
        folder = fullfile(basePath, setType, categories{i});
        files = dir(fullfile(folder, '*.jpg'));

        for j = 1:length(files)
            imgPath = fullfile(folder, files(j).name);
            img = imread(imgPath);

            img = imresize(img, [128 128]);

            if size(img, 3) == 3
                img = rgb2gray(img);
            end

            f = extractFeatures(img);
            features = [features; f];
            labels = [labels; i];
        end
    end
end

