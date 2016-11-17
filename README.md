# Burrower

A simple tool to calculate the lag of a given consumer group from [Burrow](http://github.com/linkedin/burrow)
and report it to InfluxDB.

**Works with:**
* InfluxDB 1.0.1
* Burrow latest (Commit SHA: [7930a61](https://github.com/linkedin/Burrow/commit/7930a61a3e72df5df8a59ccdf3158585b785762f))

Burrower will traverse the Burrow API and retrieve lag metrics for all clusters and consumer groups that are available.

Metrics are sent to InfluxDB with the following values and tags:

**Values**
* offset
* lag

**Tags**
* cluster
* consumer_group
* topic
* partition

###Configuration

Note that this version supports InfluxDb-style config overrides via environment variables. Those environment variables are:

```
BURROWER_BURROW_HOST
BURROWER_BURROW_PORT
BURROWER_WRITER
BURROWER_INFLUX_HOST
BURROWER_INFLUX_PORT
BURROWER_INFLUX_DATABASE
BURROWER_INFLUX_SERIES
BURROWER_INFLUX_USERNAME
BURROWER_INFLUX_PASSWORD
```

otherwise, edit conf/application.conf



## Build docker image (no dependencies besides docker-machine)

I have it set up with a `forestjohnsonpeoplenet/scala-sbt:0.13.13` image, you can *edit the dockerfile* to use [hseeberger/scala-sbt](https://hub.docker.com/r/hseeberger/scala-sbt/) or build your own like I did.

1. `docker-machine ssh`
1. `git clone https://github.com/splee/burrower.git`
1. `cd burrower`
1. `/bin/sh build.sh`
1. `/bin/sh bake.sh`



## Build & Run manually

1. `git clone https://github.com/splee/burrower.git`
1. `cd burrower && sbt assembly`
1. Update configuration, saving it as `conf/application.conf` (example config file: `burrow/conf/application.conf.example`)
1. `java -cp target/scala-2.11/burrower-0.2.1.jar:conf/ com.github.splee.burrower.OffsetMonitor`

## Planned Features

* Ability to specify any class implmenting `com.github.splee.burrower.write.Writer` to write metrics to custom back ends.
* Tests!
* Packaging for Debian with sane defaults and an Upstart configuration.


*NOTE: While this code seems stable, it has not been extensively tested.  If you have any problems please open an issue (or better yet, a pull request).*
