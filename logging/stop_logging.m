function stop_logging()
	% Stops logging by closing the log file and resetting the global log file identifier.
	%
	% Author: Wolf van der Hert

    global LOG_FID

    if ~isempty(LOG_FID) && LOG_FID ~= -1
        pl('Logging stopped at %s\n', string(datetime('now', 'Format', 'yyyy-MM-dd-HH:mm:ss')));
        fclose(LOG_FID);
        LOG_FID = [];
    end

end