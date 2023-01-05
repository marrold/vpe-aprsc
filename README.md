# vpe-aprsc

Files to build a docker container that runs an instance of [aprsc](https://github.com/hessu/aprsc) 

It's intended for use with the [Virtual Packet Environment](https://wiki.oarc.uk/virtual_packet_environment) but might be useful to someone else.

# Usage 

It's assumed you'll be using this container with docker-compose. See `docker-compose.yml` for an example.

`aprsc.conf` should be mounted as a volume. See `aprsc-example.conf` for an example. More info on configuring aprsc can be found [here](https://github.com/hessu/aprsc/blob/main/doc/CONFIGURATION.md)

# License

This project is released under the MIT license.
