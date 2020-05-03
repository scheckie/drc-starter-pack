"starter drc droid example in python"

# use roslibpy (ROS over websockets) because the python packages are only available in linux.
from roslibpy import Ros, Topic, Message
import cv2

# change this to the IP shown in your VM
GAZEBO_VM_IP = '192.168.98.129'

client = Ros(host=GAZEBO_VM_IP, port=9090)
client.run()

# consume frames from the mjpeg stream because rosbridge (websocket) encodes the binary
# images as b64, because it wraps all messages in JSON, causing a huge performance hit.
camera = cv2.VideoCapture(f"http://{GAZEBO_VM_IP}:8080/stream?topic=/droid/camera/image_raw")

drive = Topic(client, '/cmd_vel', 'geometry_msgs/Twist')
drive.advertise()

# tell the robot to drive around in a circle forever
drive.publish(Message({
    'linear': {'x': 0.1},
    'angular': {'z': 0.5}
}))


try:
    while client.is_connected:
        _, image = camera.read()

        cv2.imshow('RobotCamera', image)
        cv2.waitKey(1)
finally:
    cv2.destroyAllWindows()
