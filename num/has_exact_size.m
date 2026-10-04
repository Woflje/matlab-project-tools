function matches = has_exact_size(value, expectedSize)
    % True when VALUE has EXPECTEDSIZE, including trailing singletons.

    expectedSize = double(expectedSize(:).');
    actualSize = size(value);
    actualSize(end + 1:numel(expectedSize)) = 1;
    matches = numel(actualSize) <= numel(expectedSize) && ...
        isequal(actualSize, expectedSize);
end
