1강
=======================
Dart 문법-조건문   
-----------
if/else 예시    
----------------
void main() {    
  int number = 3;     
     
  if (number > 5) {    
    print('number는 5보다 큽니다.');     
  } else {    
    print('number는 5보다 크지 않습니다.');    
  }    
}  

switch 문   
-------------------   
switch( 확인할 변수 ) {    
	case [환인할 변수에 해당되는 값] :    
		실행로직;    
		break;   
	case [환인할 변수에 해당되는 값2] :   
		실행로직;    
		break;    
	case [환인할 변수에 해당되는 값3] :   
		실행로직;    
		break;    
	default:   
		모든 case에 해당되지 않는 경우 실행 로직 ;   
}    
         
switch문을 사용하는 경우   
>조건이 특정 값과 비교될 때     
>가독성을 높이고 싶을 때    
>enum 타입과 같은 열거형을 비교할 때    

동기(synchronous)    
----------
작업이 순차적으로 처리되는 것   
>단점: 블로킹-전체 프로그램의 응답성이 저하됨
>      비효율성-자원이 비효율적으로 사용될 수 있음

비동기(asynchronous)
---------------
작업이 병렬적으로 처리되는 것   
>단점: 복잡성-코드가 복잡해질 수 있음.
>      디버깅 어려움

async/await     
--------------
비동기처리를 동기처럼 해야 할 때
>async 키워드: 함수에 붙이면 비동기 함수가 됨. 비동기 함수는 항상 future 객체를 반환되도록 설계
>await 키워드: 비동기 함수 내에서만 사용이 가능. Future가 완료될때까지 기다리며 완료되면 결과 값을 반환. 비동기 코드를 동기 코드처럼 작성할 수 있게 해줌
'''
void resetInstantCards(int firstIndex, int secondIndex) async{
  await Future.delayed(Duration(seconds: 2)); // 추가 
  setState(() {
    cardsFlippedState[firstIndex] = false;
    cardsFlippedState[secondIndex] = false;
  });
  instantFirstCard = -1;
}
'''

클래스(객체)
-------------
'''
class [클래스명] {
		생성자()
    맴버변수//특성

    메서드(){
			//기능 
    }
}
'''

2주차-Flutter 기본기 익히기
==========================
