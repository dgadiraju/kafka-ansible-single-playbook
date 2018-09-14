/opt/kafka/bin/kafka-topics.sh \
  --create \
  --zookeeper \
    kafka01-pvt.itversity.com:2181,kafka02-pvt.itversity.com:2181,kafka03-pvt.itversity.com:2181 \
  --replication-factor 1 \
  --partitions 1 \
  --topic test

/opt/kafka/bin/kafka-console-producer.sh \
  --broker-list \
    kafka04-pvt.itversity.com:9092,kafka05-pvt.itversity.com:9092,kafka06-pvt.itversity.com:9092 \
  --topic test

/opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server \
    kafka04-pvt.itversity.com:9092,kafka05-pvt.itversity.com:9092,kafka06-pvt.itversity.com:9092 \
  --topic test \
  --from-beginning
