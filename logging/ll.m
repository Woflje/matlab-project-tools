function ll(varargin)
    % ll - Log only - logs to a file without printing to the console
    %
    % Author: Wolf van der Hert


    global LOG_FID

    [shouldLog, args] = should_log(varargin{:});

    if shouldLog && ~isempty(LOG_FID) && LOG_FID ~= -1
        fprintf(LOG_FID, args{:});
        fseek(LOG_FID, 0, 'cof');
    end
end