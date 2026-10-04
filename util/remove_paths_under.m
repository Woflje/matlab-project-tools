function removed = remove_paths_under(rootFolder)
    % Remove MATLAB path entries at or below one directory.

    arguments
        rootFolder (1, 1) string
    end

    rootFolder = stripTrailingSeparators(rootFolder);
    entries = string(strsplit(path, pathsep));
    entries = entries(strlength(entries) > 0);
    prefix = rootFolder + filesep;
    remove = strcmpi(entries, rootFolder) | ...
        startsWith(entries, prefix, 'IgnoreCase', true);
    removed = entries(remove);
    if ~isempty(removed)
        rmpath(strjoin(removed, pathsep));
    end
end

function value = stripTrailingSeparators(value)
    value = string(value);
    isDriveRoot = ~isempty(regexp(char(value), ...
        '^[A-Za-z]:[\\/]$', 'once'));
    while strlength(value) > 1 && ~isDriveRoot && ...
            (endsWith(value, "/") || endsWith(value, "\"))
        value = extractBefore(value, strlength(value));
    end
end
