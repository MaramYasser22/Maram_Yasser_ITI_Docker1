#!/bin/bash

x=`pwd`

cd mysql/
docker build -t maram/mysql .

cd $x
cd wordpress/
docker build -t maram/downloader .

cd $x
cd phpfpm/
docker build -t maram/phpfpm .

cd $x
cd nginx/
docker build -t maram/nginx .

cd $x


docker run -d  --name mysql maram/mysql
docker run -i -t  --name downloader maram/downloader
docker run -d  --name app1 --volumes-from downloader --link mysql:db maram/phpfpm
docker run -d  --name app2 --volumes-from downloader --link mysql:db maram/phpfpm
docker run -d -p 9080:80 --name nginx --volumes-from downloader --link app1:app1 --link app2:app2 maram/nginx
