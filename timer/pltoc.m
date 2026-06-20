function elapsed = pltoc(varargin)
	% Print log and stop a named timer
	%
	% Examples:
	%   pltoc('name')
	%   pltoc('debug', 'name')
	%
	% Author: Wolf van der Hert

    global PL_TIMERS

    if nargin == 1
        logArgs = {};
        name = varargin{1};
    elseif nargin == 2
        logArgs = {varargin{1}};
        name = varargin{2};
    else
        error('pltoc expects name or logLevel, name.');
    end

    name = char(string(name));

    if isempty(PL_TIMERS) || ~isKey(PL_TIMERS, name)
        warning('Timer "%s" was not started.', name);
        elapsed = NaN;
        return
    end

    elapsed = toc(PL_TIMERS(name));

    pl(logArgs{:}, '[timer] Finished: %s in %s\n', name, format_seconds(elapsed));
end