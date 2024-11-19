트러블슈팅
=====================
HomePage의 좌석 선택 버튼 가로폭 조정   
------------------------------
조정 전에는 좌석 선택 버튼이 출발 도착 선택 폭과 같지 않았다.
>'''
 SizedBox(
              width: double.infinity,
'''
와 같이 width코드를 추가하여 위아래 버튼 가로폭을 통일하였다.          

StationListPage 한번만 구현하는 법
--------------------------
과제 명세에는 StationListPage가 하나인데 어떻게 효과적으로 페이지 재활용을 할 수 있을까 하다 isDeparture을 썼다.
>title: Text(isDeparture ? '출발역 선택' : '도착역 선택'),
와 같이 코드를 사용하여 true일 때는 appbar에서 출발역 선택을 반환하고, false일 때는 도착역 선택을 반환하도록 하여 Page하나를 재활용하였다.
