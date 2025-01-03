1)sudo yum -y install java-11

# Replace YOUR MSK VERSION With AWS MSK version that is visible on AWS MSK console
 
2)wget https://archive.apache.org/dist/kafka/{YOUR MSK VERSION}/kafka_2.13-{YOUR MSK VERSION}.tgz

3) tar -xzf kafka_2.13-{YOUR MSK VERSION}.tgz

# Go to the libs directory (/home/ec2-user/kafta version/libs) and download the Iam module that is necessary for the client to access msk

4) wget https://github.com/aws/aws-msk-iam-auth/releases/download/v1.1.1/aws-msk-iam-auth-1.1.1-all.jar

# Similarly create a client.properties file in bin directory (touch client.properties; vi client.properties)

5) Write the text security.protocol=SASL_SSL in the client.properties file

# Now create a topic in the cluster
# Replace  BootstrapServerString with broker endpoints which can be find in View client information after the cluster is active
# Sample endpoints (b-1.mskgithub.z7at45.c6.kafka.us-east-1.amazonaws.com:9092,b-2.mskgithub.z7at45.c6.kafka.us-east-1.amazonaws.com:9092)
# You can choose your own partition number
# Replication factor depends on the no of availability zones you wanted in the process of cluster creation .

6) <path-to-your-kafka-installation>(i.e /home/ec2-user/kafta Version)/bin/kafka-topics.sh --create --bootstrap-server BootstrapServerString --command-config client.properties --replication-factor 3 --partitions 1 --topic MSKTutorialTopic

#start the console produces
# Replace  BootstrapServerString with broker endpoints which can be find in View client information after the cluster is active
# Sample endpoints (b-1.mskgithub.z7at45.c6.kafka.us-east-1.amazonaws.com:9092,b-2.mskgithub.z7at45.c6.kafka.us-east-1.amazonaws.com:9092)

7) <path-to-your-kafka-installation>/bin/kafka-console-producer.sh --broker-list BootstrapServerString --producer.config client.properties --topic MSKTutorialTopic

# Start the consumer
<path-to-your-kafka-installation>/bin/kafka-console-consumer.sh --bootstrap-server BootstrapServerString --consumer.config client.properties --topic MSKTutorialTopic --from-beginning
