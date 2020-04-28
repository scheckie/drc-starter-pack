from roslibpy import Ros, Topic, Message
import time

# change this to the IP shown in your VM
GAZEBO_VM_IP = '192.168.98.129'

client = Ros(host=GAZEBO_VM_IP, port=9090)
client.run()

camera = Topic(client, '/droid/camera/image_raw', 'sensor_msgs/Image')

def image_callback(msg):
    # TODO: parse image message data and display using matplotlib
    
    drive.publish(Message({
        'linear': { 'x': 0.1 },
        'angular': { 'z': 0.5 }
    }))

camera.subscribe(image_callback)

drive = Topic(client, '/cmd_vel', 'geometry_msgs/Twist')

while client.is_connected:
    time.sleep(1)

camera.unsubscribe()
client.terminate()
