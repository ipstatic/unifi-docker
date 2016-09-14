# UniFi Docker Image

A Docker image for the [Ubiquiti UniFi Controller](https://www.ubnt.com).

## Usage

```bash
docker run --rm --name unifi -v unifi:/opt/unifi/data -p 8080:8080 -p 8443:8443 -p 8843:8843 -p 8880:8880 ipstatic/unifi:latest`
```
