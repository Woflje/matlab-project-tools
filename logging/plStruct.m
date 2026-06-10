function plStruct(s, prefix)
%pl all field names and values in a struct.
%
% Example:
%   settings.use_noise = true;
%   settings.gain = 10;
%   printStruct(settings, "settings")

    if nargin < 2
        prefix = "struct";
    end

    fields = fieldnames(s);

    for i = 1:numel(fields)
        name = fields{i};
        value = s.(name);
        fullName = prefix + "." + name;

        if isstruct(value)
            plStruct(value, fullName);
        else
            pl('%s = %s\n', fullName, valueToString(value));
        end
    end
end