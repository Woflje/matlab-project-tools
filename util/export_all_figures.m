function exported_files = export_all_figures(export_dir, FigList)
    % Save selected figures as FIG and JPG files.

    if nargin < 2
	    FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
    end
    exported_files = strings(numel(FigList), 2);

    pl('Exporting figures to %s...\n', export_dir);
    if ~isfolder(export_dir)
        mkdir(export_dir);
    end

    for iFig = 1:length(FigList)
        FigHandle = FigList(iFig);

        % Try figure window name first
        FigName = string(get(FigHandle, 'Name'));

        % If empty, try the title of the first axes
        if strlength(FigName) == 0
            ax = findobj(FigHandle, 'Type', 'axes');

            if ~isempty(ax)
                FigName = string(get(get(ax(1), 'Title'), 'String'));
            end
        end

        % Fallback if still empty
        if strlength(FigName) == 0
            FigName = "figure_" + iFig;
        end

        % Make filename safe
        FigName = regexprep(FigName, '[^\w\s-]', '');
        FigName = regexprep(FigName, '\s+', '_');
        if strlength(FigName) == 0
            FigName = "figure_" + iFig;
        end

        baseName = FigName;
        suffix = 2;
        while isfile(fullfile(export_dir, FigName + ".fig")) || ...
                isfile(fullfile(export_dir, FigName + ".jpg"))
            FigName = baseName + "_" + suffix;
            suffix = suffix + 1;
        end

        exported_files(iFig, 1) = fullfile(export_dir, FigName + ".fig");
        exported_files(iFig, 2) = fullfile(export_dir, FigName + ".jpg");
        savefig(FigHandle, exported_files(iFig, 1));
        saveas(FigHandle, exported_files(iFig, 2));
    end
end
