function times = droid(n)

CreateRosConnection();

% subscribe to topics
camera = rossubscriber('/uni_teamname/droid/camera/image_raw');
drive = rospublisher("/uni_teamname/cmd_vel", "geometry_msgs/Twist");

% show livestream from the robot while controlling it
figure; axis image;
frame = imshow([]);

times = [];

for i = 1:n
    times = [times; datetime()];
    % perceive
    image = readImage(receive(camera));
    set(frame, 'CData', image); % update livestream

    % drive around in a circle
    command = rosmessage(drive);
    command.Angular.Z = 0.5;
    command.Linear.X = 0.1;

    % tell the robot to do the thing
    send(drive, command);
    disp('send');
end

rosshutdown()
