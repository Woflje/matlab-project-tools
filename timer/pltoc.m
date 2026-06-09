function elapsed = pltoc(name)
	% Print log and stop a named timer
	%
	% Example:
	%   pltoc('name')
	%
	% Author: Wolf van der Hert

    global PL_TIMERS

    name = char(string(name));

    if isempty(PL_TIMERS) || ~isKey(PL_TIMERS, name)
        warning('Timer "%s" was not started.', name);
        elapsed = NaN;
        return
    end

    elapsed = toc(PL_TIMERS(name));

    pl('[timer] Finished: %s in %s\n', name, format_seconds(elapsed));

end