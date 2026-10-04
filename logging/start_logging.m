function log_file = start_logging(logs_parent_dir, log_name)
    % Start a uniquely named text log below a logs directory.

    global LOG_FID %#ok<*GVMIS>

    log_dir = fullfile(logs_parent_dir, 'logs');

    mkdirp(log_dir)        

    if nargin < 2 || strlength(string(log_name)) == 0
        log_name = string(datetime('now', ...
            'Format', 'yyyy-MM-dd-HH-mm-ss-SSS'));
    end
    log_name = regexprep(string(log_name), '[^\w-]', '_');
    base_name = "log_" + log_name;
    log_file = fullfile(log_dir, base_name + ".txt");
    suffix = 2;
    while isfile(log_file)
        log_file = fullfile(log_dir, base_name + "_" + suffix + ".txt");
        suffix = suffix + 1;
    end

    LOG_FID = fopen(log_file, 'w');

    if LOG_FID == -1
        error('Could not open log file: %s', log_file);
    end

    pl('Logging started at %s\n', datetime('now', 'Format', 'yyyy-MM-dd-HH:mm:ss'));
end
