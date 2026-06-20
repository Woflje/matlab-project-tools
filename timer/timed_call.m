function varargout = timed_call(varargin)
	% Calls fn(varargin{:}) with pltic/pltoc around it.
	% Optional log level as first argument:
	%
	%   timed_call(timerName, fn, ...)
	%   timed_call(logLevel, timerName, fn, ...)
	%
	% pltoc is guaranteed through onCleanup.
	%
	% Author: Wolf van der Hert

    if nargin < 2
        error('timed_call requires at least timerName and fn.');
    end

    % Default form:
    %   timed_call(timerName, fn, ...)
    logLevel = [];
    timerName = varargin{1};
    fn = varargin{2};
    fnArgs = varargin(3:end);

    % Optional log-level form:
    %   timed_call(logLevel, timerName, fn, ...)
    if nargin >= 3 && isa(varargin{3}, 'function_handle')
        logLevel = varargin{1};
        timerName = varargin{2};
        fn = varargin{3};
        fnArgs = varargin(4:end);
    end

    if isempty(logLevel)
        pltic(timerName);
        cleanupObj = onCleanup(@() pltoc(timerName));
    else
        pltic(logLevel, timerName);
        cleanupObj = onCleanup(@() pltoc(logLevel, timerName));
    end

    nout = max(1, nargout);
    varargout = cell(1, nout);

    [varargout{:}] = fn(fnArgs{:});
end