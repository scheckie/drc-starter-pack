%% Connect to the server

CreateRosConnection();
%% Create some publishers

% Publisher to the cmd_vel topic. Replace 'uni_temname'.
uni_teamname_velPub = rospublisher('/uni_teamname/cmd_vel');


%% Create some subscribers


% Subscribe to the officating/start topic.
uni_teamname_startSub = rossubscriber('/officiating/start','std_msgs/String','BufferSize',1);
uni_teamname_startSub.NewMessageFcn = @(sub_OBJ, msg_OBJ) WaitForStart(sub_OBJ, msg_OBJ);



%% Start the robot
SendStartSignal();