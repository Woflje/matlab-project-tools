function txt = format_seconds(seconds)

    if seconds < 60
        txt = sprintf('%.3f s', seconds);
    elseif seconds < 3600
        txt = sprintf('%.2f min', seconds / 60);
    else
        txt = sprintf('%.2f h', seconds / 3600);
    end

end