function pl(varargin)
	% pl - Print and Log - prints to the console and logs to a file
	%
	% Author: Wolf van der Hert

	[shouldLog, args] = should_log(varargin{:});

	
    if shouldLog
        fprintf(args{:});
        ll(args{:});
    end

end