function export_all_figures(export_dir)
	FigList = findobj(allchild(0), 'flat', 'Type', 'figure');

    pl('Exporting figures to %s...\n', export_dir);
    mkdir(export_dir);

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

        savefig(FigHandle, fullfile(export_dir, FigName + ".fig"));
        saveas(FigHandle, fullfile(export_dir, FigName + ".jpg"));
    end