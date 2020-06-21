testPub = rospublisher('/officiating/start','std_msgs/String');
testData = rosmessage(testPub);
testData.Data = 'start';
send(testPub,testData);