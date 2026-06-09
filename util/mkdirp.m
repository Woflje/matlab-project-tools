function mkdirp(dir_path)
	% Recursively create directories if they do not exist
	if ~exist(dir_path, 'dir')
		mkdir(dir_path);
	end
end