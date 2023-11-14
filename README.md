# Docker for PHP


## 2023-11-15 Docker Hello World

docker နဲ့ Hello World တော့ရပြီ။

ဘာတွေဘယ်လိုဖြစ်နေလဲဆိုတာတော့ စာဖတ်ရမယ်။

နောက် .env file တွေ

နောက် docker တစ်ခုမှာ db run ထားတာကို နောက် docker တစ်ခုက access လုပ်ချင်တာတွေ။


build မယ်ဆိုရင်
```bash
docker build -t our-desired-image-name .
# ဉပမာ
docker build -t laravel .
```

run မယ် ဆိုရင်

```bash
docker run -p 8080:80 laravel
```


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