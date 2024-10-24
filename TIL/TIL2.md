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
플러터의 기본 위젯(stateless, stateful 위젯) 익히기    
View 위젯, Layout위젯, 기능성 위젯 익히기    
앱을 만들기 전 구상단계    
    
플러터에서 위젯 만드는 방법 3가지
---------------------------
1. 플러터 기본 내장 위젯    
2. pub.dev에서 공유되는 위젯    
3. 직접   

위젯의 구성-클래스
---------------------
'''
class Text extends StatelessWidget {//상속
  
  const Text(
    String this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    @Deprecated(
      'Use textScaler instead. '
      'Use of textScaleFactor was deprecated in preparation for the upcoming nonlinear text scaling support. '
      'This feature was deprecated after v3.12.0-2.0.pre.',
    )
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : textSpan = null,
  
  .... 생략 
  
  final String? data;
  final InlineSpan? textSpan;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  .... 생략 
  
  @override
  Widget build(BuildContext context) {
  ... 생략 
  }
  '''
       
StatefulWidget과 StatelessWidget
-----------------------
StatelessWidget   
>immutable한 것이 특징.(변경을 할 수 없는 위젯)
>한번 클래스 생성 후 내부 멤버 변수들의 변화 x)    
>장점: 단순성, 예측 가능
>사용방법: 만들고자 하는 클래스 만든 후 statelesswidget 상속 받고 build함수 재정의   
>'''
>class FirstMyWidget extends StatelessWidget{
	const FirstMyWidget({super.key});

	@override
  Widget build(BuildContext context) {
    return Text('나의 첫번째 위젯입니다.');
  }
}
>'''
StatefulWidget
>런타임 중에 모양과 동작을 변경할 수 있는 위젯
>장점: 동적 대화형 UI, 유연
>사용방법
'''
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget 예제'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counting : $_counter'),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('더하기'),
            ),
          ],
        ),
      ),
    );
  }
}
'''
라이프 사이클 이해
-------------
위젯이 생성부터 삭제 및 종료되는 단계의 과정에서 발생되는 여러가지 이벤트들의 호출 순서  
>StatelessWidget: constructor-> build()
>생명주기 간단함.
    
>StatefulWidget:
>createState(): 위젯이 처음 생성될 때 호출, 위젯과 연결된 State 객체를 생성
>@override   
>_MyWidgetState createState() => _MyWidgetState();
      
>initState(): State 객체가 처음 생성될 때 한 번 호출, 초기화 작업 수행   
>반드시 supe.initState() 호출
>'''
>@override
void initState() {
  super.initState();
  // 초기화 작업
}
>'''
     
>didChangeDependencies():
>state 객체가 UI를 그릴 때맏 호출됨, build 메서드는 위젯 트리를 반환함.
>여러 번 호출 가능
>'''
>@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('My Stateful Widget')),
    body: Center(child: Text('Hello, World!')),
  );
}
>'''
     
>didUpdateWidget(covariant T oldWidget):
>부모 위젯이 StatefulWidget을 다시 빌드할 때 호출, 이전 위젯과 새 위젯 비교하여 상태 업데이트
>'''
>@override
void didUpdateWidget(MyWidget oldWidget) {
  super.didUpdateWidget(oldWidget);
  // 위젯이 업데이트될 때 작업
}
>'''
           
>setState(VoidCallback fn):   
>상태를 변경하고 UI를 다시 빌드해야 할 때 호출, setState 내부의 함수는 상태를 변경하는 작업 수행
>'''
>void _updateState() {
  setState(() {
    // 상태 변경 작업
  });
}
>'''
     
View 위젯
---------------
PageView 위젯
--------------
책처럼 가로 또는 세로로 스와이프 할 수 있는 페이지를 만드능 위젯    
>children: 슬라이드를 사용할 자식 위젯 만듦
>scrollDirection: 슬라이드 방향 결정 (가로/세로)
>
