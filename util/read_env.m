function value = read_env(key, defaultValue, envFile)
	%READ_ENV Read value from .env file, OS env, or fallback default
	%
	% Usage:
	%   data_dir = read_env("data_dir", "data")
	%   data_dir = read_env("data_dir", "data", ".env.local")
	% Author: Wolf van der Hert

    if nargin < 3
        envFile = ".env";
    end

    key = string(key);
    value = defaultValue;

    if isfile(envFile)
        lines = readlines(envFile);

        for i = 1:numel(lines)
            line = strtrim(lines(i));

            if line == "" || startsWith(line, "#")
                continue;
            end

            parts = split(line, "=", 2);

            if numel(parts) ~= 2
                continue;
            end

            envKey = strtrim(parts(1));
            envValue = strtrim(parts(2));

            if envKey == key
                value = strip_quotes(envValue);
                return;
            end
        end
    end

    osValue = getenv(key);

    if ~isempty(osValue)
        value = string(osValue);
    end
end

function value = strip_quotes(value)
    value = string(value);

    if strlength(value) >= 2
        firstChar = extractBetween(value, 1, 1);
        lastChar = extractBetween(value, strlength(value), strlength(value));

        if (firstChar == """" && lastChar == """") || ...
           (firstChar == "'" && lastChar == "'")
            value = extractBetween(value, 2, strlength(value) - 1);
        end
    end
end