function llchapter(varargin)
	% Log only - a formatted chapter/header using ll()
	%
	% Example:
	%   llchapter('Settings')
	%
	% Output:
	%   ============
	%   = Settings =
	%   ============
	%
	% Author: Wolf van der Hert

    [shouldLog, args] = should_log(varargin{:});

    if shouldLog
        titleText = sprintf(args{:});

        side_margin = 6;

        lineText = repmat('=', 1, strlength(titleText) + 2 + 2*side_margin);

        sideSpaces = repmat(' ', 1, side_margin);

        ll('\n%s\n', lineText);
        ll('=%s%s%s=\n', sideSpaces, titleText, sideSpaces);
        ll('%s\n\n', lineText);
    end

    

end