# 네모 프로젝트
--------------


### 네모 프로젝트란?
- KTX는 네명이서 예매를 하면 할인을 받을 수 있습니다. 현재 학교에서는 카카오톡 단톡방을 이용하여 모집하고 있습니다. 이는 체계적인 모집을 하기에 부족한 점이 있기에 이를 위한 웹 애플리케이션을 제작하였습니다. 
- 진행 기간: 2018. 07. 23. - 2018. 08. 04.


### 결과
![login](https://github.com/KoEonYack/Nemo-Project/blob/master/img/login.png?raw=true)
- 메인 페이지, 로그인을 해야 접근할 수 있습니다.


![main](https://github.com/KoEonYack/Nemo-Project/blob/master/img/main.png?raw=true)
- 각 도시별로 몇 개의 모집이 이루어지고 있는지 보여주고 있습니다.


![city1](https://github.com/KoEonYack/Nemo-Project/blob/master/img/select_city.png?raw=true)
- KTX를 모집을 위해서 출발 도시와 도착 도시를 선택합니다.  


![city2](https://github.com/KoEonYack/Nemo-Project/blob/master/img/select_city2.png?raw=true)
- 출발 역과 도착 역을 그리고 날짜를 입력합니다. 


![city3](https://github.com/KoEonYack/Nemo-Project/blob/master/img/select_city3.png?raw=true)
- 이전 두 페이지에서 입력한 정보를 가지고 KTX 시간이 나옵니다. 방 만들기 버튼을 클리갛면 성공적으로 방을 만들 수 있습니다. 


![board](https://github.com/KoEonYack/Nemo-Project/blob/master/img/board.png?raw=true)
- 모집중인 서울에서 출발하는 KTX를 볼 수 있습니다.  


![charRoom](https://github.com/KoEonYack/Nemo-Project/blob/master/img/chat_room.png?raw=true)
- 모집중인 서울에서 출발하는 KTX를 볼 수 있습니다.  


![admin](https://github.com/KoEonYack/Nemo-Project/blob/master/img/admin_page.png?raw=true)
- 관리자 페이지에서 관리자는 웹 애플리케이션 이용자가 개설한 방을 관리(삭제, 수정)할 수 있습니다.  


![admin2](https://github.com/KoEonYack/Nemo-Project/blob/master/img/admin_page2?raw=true)
- 관리자 페이지에서 사용자 정보를 한 눈에 볼 수 있습니다.  


### 개선점
- 다양한 보안 취약점 존재.
    - 본 문제를 분석하기 위해서 18년 2학기 컴퓨터보안 파이널 프로젝트로 **모의사이트 취약점 분석을 통한 시큐어 코딩의 효과성 연구**를 진행하였습니다. 본 프로젝트에서 네모 웹 애플리케이션의 보안을 위해서 행안부에서 발간한 'SW 개발보안 가이드'에서 제시하는 47가지 시큐어코딩을 적용하면서 어떻게 보안성을 높일 수 있는지 보였습니다.  
- 디자인적으로 불편한 요소 존재.
    * KTX 방 개설하는 부분에서 페이지를 동적으로 변환해서 하나의 페이지에서 방이 개설되게 해야하나 해당 부분 구현에 어려움을 느끼어 페이지를 세 번 이동해야 방을 개설이 되는 UX적인 문제가 있습니다. 
- 디자인패턴을 지키지 못함.
    * MVC모델을 잘 살려야 했으나, JSP를 이용한 첫 개발로 인하여 개발 시 다양한 문점을 해결하기 위해서 MVC 패턴을 깨며 개발한 부분이 있습니다. 


### 배운점
- 개발 단계에서 보안 취약점이 발생할 수 있기에 설계 단계에서 이 점을 고려해야 한다는 점.
- 프레임워크 선정의 중요성.
- UX도 개발 만큼 중요하다는 점.


### 업무 분담
- KoEonyack(PM, 개발자): 페이지 디자인, 도시 설정 부분 백엔드 개발, DB 설계 
- LeemHyeRin(개발자): 검색, 도시 설정 부분 백엔드 보조 개발.
- JaeIkLee730(개발자): Ajax를 이용한 채팅 구현. 
- Indiaprince(개발자): 관리자 페이지 개발.

### 사용 기술
- HTML, CSS(Bootstrap 3), Javascript, Ajax
- JSP, Servlet
- MySQL
- [공공데이터 열차정보서비스](https://www.data.go.kr/dataset/15000500/openapi.do)