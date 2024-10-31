트러블 슈팅
====================
stdin.readLineSync()
------------------
1. 입력값을 받는 이 함수는 import dart.io 를 사용해야 쓸 수 있다.
2. nullable한 string 값이므로 처음에 변수에 할당할 때는 string?를 써서 둘다 nullable함을 맞춰줘야한다.
3. 나중에 변수를 nullable하지 않게 사용하기 위해선 null 일때 예외처리를 try catch등으로 해야 오류가 나지 않는다.

productname 접근 오류
--------------------
contains 메서드를 사용하여 wishproduct가 products 목록에 있는지 확인하려했다.   
products 목록에 있는 Product객체들의 productname 속성만을 비교해야 하는데 객체 전체와 비교하여 자꾸 오류가 났다.    
따라서 products 목록에서 productname 속성만을 추출한 리스트를 새로 만든 뒤애 그 리스트에서 contain 메서드를 사용하였다.

price 검색 오류
-----------------
addToCart메서드 내의 Product.price에 접근할 때 인스턴스 변수가 아닌 클래스 이름으로 접근하려 해 오류가 발생하였다.   
아직 클래스 사용이 미숙하여 벌어진 일이였다.   
예시:totalprice = totalprice + Product.price * quantity;   
해결:var product = products.firstWhere((p) => p.productname == productname);    
    totalprice += product.price * quantity;     
입력된 productname을 검색하여 그에 맞는 price를 가져오도록 하여 해결하였다.
