### 🚗 Intro
  
<img src="https://github.com/minseonkkim/ParkingWhere/assets/76653033/891e7ef8-da91-4c62-9897-fdd2f631317a.png" width="380"/>

IT 문맹인을 위한 주정차 금지구역과 공영주차장 알림 서비스, ***주정차알리미***

### 🚗 Background
낯선 지역에서 운전 시 주정차 금지구역을 잘 알지 못해 과태료가 나오는 경우가 있다. 이 문제를 주정차 금지구역 안내 서비스로 해결할 수 있다. 이러한 디지털 기술은 우리의 삶을 편리하게 바꿔 놓았지만 디지털 기술에 적응하지 못해 서비스로부터 소외되는 노약자, 장애인 등의 IT 문맹인들이 있다.

기존의 주정차 단속 알림 서비스는 서비스 신규신청을 하려면 차량번호, 전화번호 등록 등의 복잡한 절차를 거쳐야 해서 IT 문맹인들이 서비스를 받는 것에 어려움이 있었다. 또한 지역을 선택하고 지역마다 다른 서비스에 가입해야 하며 광주광역시 내에서도 지자체 별로 별도의 서비스를 제공하여 한 번에 모든 지역 가입이 안 되는 문제점도 있었다. 

따라서 UI를 단순화하고 복잡한 인증과정 없이 필요한 서비스를 바로 제공하여 사용자 편의성을 극대화시키고 음성 안내 등의 기능을 추가하여 IT 문맹인들이 쉽게 사용할 수 있는 어플리케이션을 개발할 필요성을 느끼게 되었다.

### 🚗 IA(Information Architecture)
<img src="https://github.com/minseonkkim/ParkingWhere/assets/76653033/a4ed1a54-521f-4663-b16b-ee4d9f964b8a.png" width="750"/>


### 🚗 Demo
|메인화면|TTS 기능|지도화면|
|:-----:|:-----:|:-----:|
|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/30d10398-13f3-413e-89c6-204cfe8464d8)|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/8eeb0721-6565-4026-aece-0b6fe7cdc649)|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/1212c63b-6283-462d-8eb4-9a846af11867)|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/302455a5-6735-44a7-a0f3-d5c63f038f7f)
|직관성과 IT문맹인의 편리한 사용을 위해 버튼과 글자의 크기를 크게 설정하여 구성하였다. 하단의 스위치 버튼을 누르면 주정차 금지구역 알림 기능이 ON으로 설정된다.|알림기능을 ON한 상태에서 사용자가 주정차 금지 구역 반경 50m 이내에 3분 이상 머물렀을 경우 주정차 금지구역에 주정차를 했다고 판단하여 푸쉬 알림을 띄우고 알림 메시지를 TTS를 통해 음성으로 전달한다.|사용자의 위치 기준으로 주변의 주정차 금지/가능 구역, 불법 주정차 집중 단속 구역, 공영주차장 위치를 시각적으로 표시한다. 주정차 금지 구역은 빨간색, 가능 구역은 파란색, 집중 단속 구역은 보라색으로 표현하였다. 공영주차장의 위치를 나타내는 핀은 크게 설정하여 직관성을 높였다.

|지도화면 설명|주차장 상세페이지|경로 안내|
|:-----:|:-----:|:-----:|
|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/bd9ad155-402d-4d08-a197-83e2d59fec12)|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/3523bbdd-a0a2-4903-8218-d5a75bc6f833)|![image](https://github.com/minseonkkim/ParkingWhere/assets/76653033/8f471b05-aca9-4607-b8db-92485bbcaf03)
|지도화면 하단의 메뉴 바에서 ‘사용안내‘ 탭을 누르면 지도화면에 대한 간단한 설명을 볼 수 있다.|공영주차장 핀을 클릭하면 해당 주차장의 정보를 표시하는 페이지로 이동한다. 화면에서는 주차장의 이름과 주소, 해당 주차장의 주차 가능 구역이 얼마나 남아있는지를 표시한다. ‘전화하기’ 버튼과 ‘길찾기’ 버튼을 통해 주차장에 전화로 문의하거나 경로 안내를 받을 수 있다.|‘길찾기’ 버튼을 누르면 카카오 내비 어플이 실행된다(만약 사용자의 기기에 카카오 내비가 설치되지 않았을 경우 설치 페이지로 이동한다.) 이때 어플에서 카카오 내비에 주차장의 위치 정보를 전송하기 때문에 자동으로 경로 안내를 실시한다.



https://github.com/minseonkkim/ParkingWhere/assets/76653033/e17cc9ba-79c8-4015-841f-112233bc2ade

