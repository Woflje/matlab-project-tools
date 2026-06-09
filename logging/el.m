function el(varargin)
    % el - Error and Log - logs an error message, then throws it
    %
    % Author: Wolf van der Hert

    if nargin == 0
        error('el:NoMessage', 'No error message provided.');
    end

    if nargin >= 2 && ischar(varargin{1}) && contains(varargin{1}, ':')
        errorId = varargin{1};
        msgArgs = varargin(2:end);
    else
        errorId = 'el:Error';
        msgArgs = varargin;
    end

    msg = sprintf(msgArgs{:});

    if isempty(msg) || msg(end) ~= newline
        logMsg = [msg newline];
    else
        logMsg = msg;
    end

    ll('ERROR: %s', logMsg);

    error(errorId, '%s', strtrim(msg));
end