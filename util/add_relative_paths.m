function add_relative_paths(exclude_names)
    % Add all subdirectories of the current directory to the MATLAB path,
    % excluding those that match any of the specified names.
    % exclude_names: cell array of directory names to exclude (e.g., {'.git', 'node_modules'})
    %
    % Author: Wolf van der Hert

    if nargin < 1 || isempty(exclude_names)
        exclude_names = {
            '.git'
            '.svn'
            '.hg'
            'node_modules'
            '__pycache__'
            '.vscode'
        };
    end

    paths = strsplit(genpath(pwd), pathsep);
    paths = paths(~cellfun('isempty', paths));

    keep = true(size(paths));

    for i = 1:numel(paths)
        parts = split(paths{i}, filesep);

        for j = 1:numel(exclude_names)
            if any(strcmp(parts, exclude_names{j}))
                keep(i) = false;
                break;
            end
        end
    end

    addpath(strjoin(paths(keep), pathsep));
end