# Docker for PHP


## ဘယ်လို build

```bash
docker build -t helloapache .
docker run -lt -p 8888:8000 helloapache
```
## Docker Compose ဆိုတာဘာလဲ?

Dockerfile ဆိုတာက အိုကေပြီ။
လိုချင်တဲ့ Server Specification တွေနဲ့ Deployment Process ကို ကြိုရေးထားသလိုပဲ။

ဒါမျိုးရေးထားတာတွေကို စုထားတာကို docker-compose.yml မှာ ရေးရတာလား?


ဖုန်းက Hotspot လွှင့်ရင်ရပြီး
ရုံးက LAN နဲ့ မရတဲ့ Docker Build :P

docker tag my-php-app:latest your-dockerhub-username/my-php-app:latest
docker tag docker-php:latest aungkoman/docker-php:latest
docker push aungkoman/docker-php:latest


```bash
msd@MSDs-Mac-mini docker-php % docker build -t docker-php .
[+] Building 41.0s (3/3) FINISHED                          docker:desktop-linux
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 52B                                           0.0s
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 352B                                       0.0s
 => ERROR [internal] load metadata for docker.io/library/php:8.0-apache   40.9s
------
 > [internal] load metadata for docker.io/library/php:8.0-apache:
------
Dockerfile:2
--------------------
   1 |     # Use the official PHP image
   2 | >>> FROM php:8.0-apache
   3 |     
   4 |     # Set the working directory to /var/www/html
--------------------
ERROR: failed to solve: php:8.0-apache: failed to do request: Head "https://registry-1.docker.io/v2/library/php/manifests/8.0-apache": EOF
```