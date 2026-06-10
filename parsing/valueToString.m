function out = valueToString(value)
    if ischar(value)
        out = value;
    elseif isstring(value)
        out = strjoin(value, ", ");
    elseif isnumeric(value) || islogical(value)
        out = mat2str(value);
    elseif iscell(value)
        out = "[cell]";
    elseif isa(value, "function_handle")
        out = func2str(value);
    else
        out = "[" + class(value) + "]";
    end
end