% On the host machine, open up a command prompt and type 'ipconfig', then
% find the IPv4 address associated with VMnet1
networkAdapter_IP = '192.168.xxx.xxx';

% In the virutal machine, open up a commang prompt and type 'ifconfig', and
% find the associated IP address.
gazeboVM_IP = '192.168.xxx.xxx';

% shutdown any existing global MATLAB ROS node 
rosshutdown  

% create a global MATLAB node and connect to ROS network
my_name_for_global_MATLAB_node = '/matlab_global_node';
rosinit(gazeboVM_IP, 'NodeHost', networkAdapter_IP, ...
                     'NodeName', my_name_for_global_MATLAB_node);
                 
fprintf('Connected to ROS server.\n');
