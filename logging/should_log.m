function [shouldLog, args] = should_log(varargin)
    global settings

    shouldLog = true;
    args = varargin;

    % Optional first argument: log level
    if ~isempty(varargin) && isnumeric(varargin{1}) && isscalar(varargin{1})
        loglevel = varargin{1};
        args = varargin(2:end);

        % If settings.logging.level exists, apply the filter.
        % Otherwise, keep shouldLog = true.
        if exist('settings', 'var') && isstruct(settings) && ...
                isfield(settings, 'logging') && isstruct(settings.logging) && ...
                isfield(settings.logging, 'level') && ~isempty(settings.logging.level)

            shouldLog = settings.logging.level <= loglevel;
        end
    end
end