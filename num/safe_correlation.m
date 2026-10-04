function value = safe_correlation(first, second)
    % Pearson correlation, or NaN for constant/short inputs.

    first = first(:);
    second = second(:);
    if numel(first) < 2 || numel(second) ~= numel(first) || ...
            std(first) == 0 || std(second) == 0
        value = NaN;
        return
    end
    matrix = corrcoef(first, second);
    value = matrix(1, 2);
end
