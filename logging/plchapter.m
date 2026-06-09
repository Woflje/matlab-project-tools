function plchapter(varargin)
	% Print a formatted chapter/header using pl()
	%
	% Example:
	%   plchapter('Settings')
	%
	% Output:
	%   ============
	%   = Settings =
	%   ============
	%
	% Author: Wolf van der Hert

    titleText = sprintf(varargin{:});

	side_margin = 6;

    lineText = repmat('=', 1, strlength(titleText) + 2 + 2*side_margin);

	sideSpaces = repmat(' ', 1, side_margin);

    pl('\n%s\n', lineText);
    pl('=%s%s%s=\n', sideSpaces, titleText, sideSpaces);
    pl('%s\n\n', lineText);

end