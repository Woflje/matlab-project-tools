function value = ExtractNumberAfter(str, key)
    expr = key + "(-?\d+\.?\d*)";
    token = regexp(str, expr, "tokens", "once");

    if isempty(token)
        error("Could not extract %s from filename: %s", key, str);
    end

    value = str2double(token{1});
end