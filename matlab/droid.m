% change this to the IP shown in your VM
GAZEBO_VM_IP = "192.168.98.129";
rosinit(GAZEBO_VM_IP)

% subscribe to topics
camera = rossubscriber('/droid/camera/image_raw');
drive = rospublisher("/cmd_vel", "geometry_msgs/Twist");

% show livestream from the robot while controlling it
figure; axis image;
frame = imshow([]);

try
    while true
        % perceive
        image = readImage(receive(camera, 0.1));
        set(frame, 'CData', image); % update livestream

        % drive around in a circle
        command = rosmessage(drive);
        command.Angular.Z = 0.5;
        command.Linear.X = 0.1;
        
        % tell the robot to do the thing
        send(drive, command);
    end
catch
    % once we're done, shutdown
    rosshutdown()
end