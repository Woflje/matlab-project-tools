function pltic(name)
	% Print log and start a named timer
	%
	% Example:
	%   pltic('name')
	%
	% Author: Wolf van der Hert

    global PL_TIMERS

    if isempty(PL_TIMERS)
        PL_TIMERS = containers.Map('KeyType', 'char', 'ValueType', 'any');
    end

    name = char(string(name));
    PL_TIMERS(name) = tic;

    pl('[timer] Started: %s\n', name);

end