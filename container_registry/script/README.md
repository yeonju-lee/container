쉘을 이용하여 도커 설치 및 Container Reigstry Push 테스트를 진행한다.
https://nhnent.dooray.com/project/posts/2839227506459979181

## 1. 클라이언트에 docker 설치
* 도커 클라이언트를 toast instance 에서 진행할 경우, 도커 설치를 먼저 진행한다.
* centos 와 ubuntu 에 대한 도커 설치만 제공

### 도커 설치 진행
* git clone 을 진행
* install_docker.sh 실행 
	* os name 확인하여 os name 에 맞는 도커 설치 
* 쉘 스크립트 수행 후 docker 설치 유무 확인 위해 docker version 조회
```
$ docker version
```

## 2. container registry push
* docker file 로 docker image 생성 후, container reigstry 로 push 진행
* push 성공 : 1gb, 5gb, 9gb
* push 실패 : 13gb

### conf 수정
* container registry push 할 수 잇는 정보를 업데이트 해준다. ( registry url, id , pwd )
* 사전 조건 : container registry에 push 할 계정이 admin 또는 member 계정으로 추가되어 있어야 한다.
```
# Test Environment
Registry_URL= // Registry URL 입력
ID=           // TOAST ID 또는 IAM IAM 입력
APPKEY=       // 통합 APPKEY 또는 서비스 APPKEY 입력
```

### Push 쉘 실행

* xG_dockerfile_push.sh 실행 

* 절차
	* docker 디렉토리 생성
		* 명칭 : dockerfile_xxg_push
	* 대용량 파일 생성 
		* fallocate 사용 
	* docker file image 생성 후 빌드
	* conf 파일에 입력한 정보 사용하여, container registry로 로그인
	* docker image tag 
	* docker image push 
  
