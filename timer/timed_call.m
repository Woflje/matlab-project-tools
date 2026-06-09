function varargout = timed_call(timerName, fn, varargin)
	% Calls fn(varargin{:}) with pltic/pltoc around it.
	% pltoc is guaranteed through onCleanup.
	%
	% Author: Wolf van der Hert

    pltic(timerName);
    cleanupObj = onCleanup(@() pltoc(timerName));

    nout = max(1, nargout);
    varargout = cell(1, nout);

    [varargout{:}] = fn(varargin{:});
end