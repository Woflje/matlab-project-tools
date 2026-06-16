function ReportSeriesStats(name, x)
    x = x(:);
    x = x(isfinite(x));

    if isempty(x)
        return
    end

    pl('\n%s:\n', name)
    pl('  Initial: %.6e\n', x(1))
    pl('  Final:   %.6e\n', x(end))
    pl('  Min:     %.6e\n', min(x))
    pl('  Max:     %.6e\n', max(x))

    if numel(x) >= 2
        dx = diff(x);

        pl('  Increases: %d\n', sum(dx > 0))
        pl('  Largest increase: %.6e\n', max([dx; 0]))
        pl('  Largest decrease: %.6e\n', abs(min([dx; 0])))
    end

    if x(1) > 0
        pl('  Final / initial: %.6e\n', x(end) / max(x(1), eps))
    end
end
