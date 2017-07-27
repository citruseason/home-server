# Pavons 홈서버
개인적으로 사용하는 홈서버를 Docker화 하여 편히 어디서든 사용하능하게 만든 레퍼지토리

## 필수 도구들
- docker
- docker-compose

## 설치되는 항목
- [Nextcloud](https://nextcloud.com/)
- [nginx-proxy](https://github.com/jwilder/nginx-proxy)
- [nginx-letsencrypt](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)

## 사용법
필수 도구들을 설치 한 후 아래명령어를 입력하여 docker network를 설정합니다.
```
# 기본네트워크가 server-proxy로 설정되어있어 server-proxy 네트워크를 생성해야합니다.
$ docker network create server-proxy
```
docker network를 설정 한 후 `run.sh`를 실행합니다.
```
$ ./run.sh
Enter database password: (Password 입력)
Enter repeat password: (위와 동일한 Password 입력)
...
```
정상 구동을 확인합니다.

## Nginx 부가 설정파일
간혹 서버에 FileUpload와 같이 용량설정과 같은 필요 파라메터들이 필요할 때 아래와 같은 형식으로 `nginx/vhost.d` 폴더안에 넣어줍니다.
```
$ { echo 'client_max_body_size 10G;'; } > nginx/vhost.d/{VIRTUAL_HOST (e.g. ncloud.pavons.com)}
```