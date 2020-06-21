function WaitForStart(sub_OBJ, msg_OBJ)
% subscribe to the camera topic. Replace 'uni_temname'.
camSub = rossubscriber('/uni_teamname/droid/camera/image_raw', ...
                       'sensor_msgs/Image', 'BufferSize', 1);

velPub = evalin('base','uni_teamname_velPub');
figure;  % do ***NOT*** delete this figure !
hax                  = axes('Tag', 'TAG_AX_FOR_CBACK');
camSub.NewMessageFcn = @(sub_OBJ, msg_OBJ) brads_image_proc_and_display(sub_OBJ, msg_OBJ, hax,velPub);
assignin('base','uni_teamname_camSub',camSub);

disp('start');
end

