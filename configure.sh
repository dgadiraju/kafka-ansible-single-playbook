# Add myids for zookeeper
ssh admin@kafka01-pvt.itversity.com "sudo -u zookeeper sh -c 'echo 1 > /data1/zookeeper/myid'"
ssh admin@kafka02-pvt.itversity.com "sudo -u zookeeper sh -c 'echo 2 > /data1/zookeeper/myid'"
ssh admin@kafka03-pvt.itversity.com "sudo -u zookeeper sh -c 'echo 3 > /data1/zookeeper/myid'"

# Update server.properties for kafka with broker id
ssh admin@kafka04-pvt.itversity.com \
  "sudo -u kafka sh -c \"sed -i 's/broker.id=0/broker.id=1/g' /opt/kafka/config/server.properties\""
ssh admin@kafka05-pvt.itversity.com \
  "sudo -u kafka sh -c \"sed -i 's/broker.id=0/broker.id=2/g' /opt/kafka/config/server.properties\""
ssh admin@kafka06-pvt.itversity.com \
  "sudo -u kafka sh -c \"sed -i 's/broker.id=0/broker.id=3/g' /opt/kafka/config/server.properties\""

ansible ensemble \
  -i hosts \
  -m script \
  -a "/home/training/kafka-ansible/single-playbook/scripts/zookeeper-service.sh start" \
  --become-user zookeeper \
  --become

ansible brokers \
  -i hosts \
  -m script \
  -a "/home/training/kafka-ansible/single-playbook/scripts/kafka-service.sh" \
  --become-user kafka \
  --become
