function result = merge_structs(base, overrides)
    % Recursively override fields in scalar configuration structs.

    arguments
        base (1, 1) struct
        overrides (1, 1) struct
    end

    result = base;
    names = fieldnames(overrides);
    for index = 1:numel(names)
        name = names{index};
        value = overrides.(name);
        if isstruct(value) && isscalar(value) && ...
                isfield(result, name) && isstruct(result.(name)) && ...
                isscalar(result.(name))
            result.(name) = merge_structs(result.(name), value);
        else
            result.(name) = value;
        end
    end
end
