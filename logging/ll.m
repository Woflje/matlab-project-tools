function ll(varargin)
    % ll - Log only - logs to a file without printing to the console
    %
    % Author: Wolf van der Hert

    global LOG_FID

    if ~isempty(LOG_FID) && LOG_FID ~= -1
        fprintf(LOG_FID, varargin{:});
        fseek(LOG_FID, 0, 'cof');
    end
end