# `netserver` (with demo) and `netperf` OCI containers for RouterOS


> **Warning** 
> This project is still under development.  It may be incomplete, inaccurate, or just "break things".  Use at your own risk.


### Using...


> **Warning** 
> Please review code here before use!  

A RouterOS script file is provided here that will do all the "heavy lifting" of creating the containers.  Feedback is welcomed – no promises, but file an issue.

> **Note**
> More docs coming.



### Notes

#### best method to masquerade/NAT to netserver (e.g. netmap)
https://stackoverflow.com/questions/11981480/error-in-running-netperf-udp-stream-over-openvpn/24211455#24211455
https://serverfault.com/questions/802320/netperf-iptables-masquerade-network-unreachable


## Credits

### netperf-docker
The project started it's life as a fork of:
> Dockerfile for minimalistic image with netperf. Based on alpine-linux, the final image is below 5 MB and available on docker hub: 
> https://hub.docker.com/r/tailoredcloud/netperf/.
 which had the "stock" netserver (e.g. without the "demo mode" needed for Flent):
