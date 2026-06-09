function start_logging(logs_parent_dir)

    global LOG_FID

    log_dir = fullfile(logs_parent_dir, 'logs');

    mkdirp(log_dir)        

    current_date = char(datetime('now', 'Format', 'yyyy-MM-dd-HH-mm-ss'));
    log_file = fullfile(log_dir, ['log_' current_date '.txt']);

    LOG_FID = fopen(log_file, 'w');

    if LOG_FID == -1
        error('Could not open log file: %s', log_file);
    end

    pl('Logging started at %s\n', datetime('now', 'Format', 'yyyy-MM-dd-HH:mm:ss'));
end