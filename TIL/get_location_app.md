출력 오류
=======================
![image](https://github.com/user-attachments/assets/ae81c1d4-e367-4d02-91a8-83f2a343b0b6)
>위와 같이 특정 장소들은 < b >와 같은 것이 출력되는데 이유를 모르겠다.


http 연결 불가 오류
==================
detailpage로 넘어갈 떄 링크가 http인 경우 net::ERR_CLEARTEXT_NOT_PERMITTED 오륙 뜨면서 웹페이지에 연결되지 않는 오류가 발생하였다.     
이는 보통 안드로이드에서 HTTP 요청을 사용하려 할 때 발생한다고 한다.       
Android 9(Pie) 이상의 버전에서 cleartext HTTP 요청을 기본적으로 차단하기 때문인데, Android에서는 보안상의 이유로 HTTP 요청을 차단하고, HTTPS 프로토콜을 사용하도록 강제하고 있다.             
이를 해결하기 위해선 android/app/src/main/AndroidManifest.xml 파일 수정: cleartext 요청을 허용하려면 AndroidManifest.xml에 uses-cleartext-traffic 속성을 추가해야 한다.    

><application    
  android:usesCleartextTraffic="true"  <!-- 이 줄을 추가합니다 -->    
  ... >
  
"< / application>" <<이부분이 자꾸 날라감
=====================
>>왜인지 모르게 위 코드는 코드블록 처리가 되지 않는다?? 마크다운 문법과 충돌하는 것 같다
