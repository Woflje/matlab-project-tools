function pl(varargin)
	% pl - Print and Log - prints to the console and logs to a file
	%
	% Author: Wolf van der Hert
    global LOG_FID

    fprintf(varargin{:});

    if ~isempty(LOG_FID) && LOG_FID ~= -1
        fprintf(LOG_FID, varargin{:});
        fseek(LOG_FID, 0, 'cof');
    end

end