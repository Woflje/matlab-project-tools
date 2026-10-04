function added = add_existing_paths(folders, placement)
    % Add existing folders in the requested path position.

    arguments
        folders string
        placement (1, 1) string {mustBeMember(placement, ["-begin", "-end"])} = "-begin"
    end

    folders = unique(folders(:), 'stable');
    added = folders(isfolder(folders));
    if ~isempty(added)
        addpath(strjoin(added, pathsep), placement);
    end
end
