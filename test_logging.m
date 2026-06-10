addpath('util');
add_relative_paths();

global settings

settings.logging.level = 0;
% 0: Nothing
% 1: Info
% 2: Detailed info
% 3: Everything / DEBUG

start_logging('test_logs');

plchapter(1,'Logging test');
pl(1,'This is printed and logged info.\n');
pl(2,'This is printed and logged detailed info.\n');
pl(3,'This is a printed and logged debug message.\n');
llchapter(1,'Logging test: Only logged')
ll(1,'This is logged but NOT printed info.\n');
ll(2,'This is logged but NOT printed detailed info.\n');
ll(3,'This is a logged but NOT printed debug message.\n');

stop_logging();