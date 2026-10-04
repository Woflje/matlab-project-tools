function pltic(varargin)
	% Print log and start a named timer
	%
	% Examples:
	%   pltic('name')
	%   pltic('debug', 'name')

    global PL_TIMERS %#ok<*GVMIS>

    if nargin == 1
        logArgs = {};
        name = varargin{1};
    elseif nargin == 2
        logArgs = {varargin{1}};
        name = varargin{2};
    else
        error('pltic expects name or logLevel, name.');
    end

    if isempty(PL_TIMERS)
        PL_TIMERS = containers.Map('KeyType', 'char', 'ValueType', 'any');
    end

    name = char(string(name));
    PL_TIMERS(name) = tic;

    pl(logArgs{:}, '[timer] Started: %s\n', name);
end