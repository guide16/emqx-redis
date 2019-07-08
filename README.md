插件说明
-------------

插件将客户端上下线信息记录在redis，以实现对相同订阅信息客户端的连接管理，可用于强制连接断开

Version
-------------

master 适配EMQ v3.0.0 单节点版本
release 适配EMQ v3.0.0 支持cluster

编译说明
-------------
1. clone emq-relx project
```	
git clone https://github.com/emqtt/emq-relx.git v2.3.11 / v3.0.0
```

2. Add DEPS of the plugin in the Makefile
```
DEPS += emqx_redis
dep_emqx_redis = git https://github.com/guide16/emqx_redis.git master
```

3. Add load plugin in relx.config

```
{emqx_redis, load},

```

4. Build
```
cd emq-relx && make
```  
Configuration
----------------------
You will have to edit the configurations of the bridge to set the kafka Ip address and port.

Edit the file emq-relx/deps/emqttd_kafka_bridge/etc/emqttd_kafka_bridge.config
```
emqx.redis.init_nodes = 127.0.0.1:7639, 127.0.0.1:17639
emqx.redis.pool_size = 5
emqx.redis.pool_max_overflow = 0
emqx.redis.database = 0
emqx.redis.password = test

```

Start the EMQ broker and load the plugin 
-----------------

1) cd emq-relx/_rel/emqx
2) ./bin/emqx start
3) ./bin/emqx_ctl plugins load emqx_kafka_bridge
