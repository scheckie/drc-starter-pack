function brads_image_proc_and_display(sub_OBJ, msg_OBJ, hax, velPub)
% This function is expected to be the callback function for a ROSSUBSCRIBER
% object
%
% DOC'd here: web(fullfile(docroot, 'robotics/ref/subscriber-object.html'))

    %fprintf('\n #.. hello ! <%s>', datestr(now) );
      
    img     = readImage(msg_OBJ);
    if( ~ishghandle(hax) )
        fprintf('\n +++++ NO AXES !!');
       return
    end
    
    %--------------------------------------------------------------------
    % The algorithm I am testing
    %--------------------------------------------------------------------
    ed_img = edge(rgb2gray(img), 'sobel');
    
    imagesc(ed_img,'Parent',hax)
       
    % TODO: revisit this
    %   imshow(ed_img,'Parent', hax); 
    %--------------------------------------------------------------------
    
    
    
    % Send movement data to robot.
    velData           = rosmessage(velPub);
    velData.Linear.X = 0.5; % move forward.
    velData.Angular.Z = 0.5; % rotate.    
    send(velPub,velData);
    
end