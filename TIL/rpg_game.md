트러블 슈팅
==============
1. vscode에서 파일 절대경로를 "C:\Users\KGE\dart"와 같이 했을 때 찾지 못하는 오류가 있었다.    
>"C:\\Users\\KGE\\dart"와 같이 슬래쉬를 두개햐야 인식할 수 있다.
2. character 정보를 파일에서 읽어오는 함수 타입을 void로 했더니 반환하는 값이 없어 오류가 났다.
>void를 Character로 바꾸어 Character 클래스로 값을 반환하도록 하여 해결했다.
3. 몬스터를 두마리 뽑아내면 게임이 종료되는 오류가 있었다. game class의 startGame메서드의 while의 조건문 문제였다.
>'''
>void startGame() {//게임을 시작하고 종료하는 메서드
    print("게임을 시작합니다!");
    while (character.health > 0 && defeatedMonsters < monsters.length) { <<!문제 발생!
      battle();
      if (character.health <= 0) {//캐릭터 체력 0되면 종료
        print("캐릭터가 쓰러졌습니다. 게임 종료.");
        break;
      }
      if (defeatedMonsters == monsters.length) { <<!문제 발생!
        print("모든 몬스터를 물리쳤습니다. 승리!");
        break;
      }
      print("다음 몬스터와 대결하시겠습니까? (y/n)");
      String choice = stdin.readLineSync() ?? 'n';
      if (choice.toLowerCase() != 'y') {
        break;
      }
    }
>'''
>위와 같이 물리친 몬스터 수와 몬스터 리스트 길이를 비교하는 조건문이다.   
>그러나 battle 메서드에서 물리친 몬스터를 몬스터 리스트에서 삭제하는 remove를 사용했었기 때문에 몬스터 리스트 길이가 줄어든다.
>따라서 리스트에 몬스터가 세마리 있을 때 몬스터를 두마리 처치하게 되면 리스트 길이보다 처치 몬스터 수가 많아지므로 while문이 종료되었다.
>이러한 문제를 조건문을 몬스터 리스트.isnotempty와 같이 수정하여 리스트가 비었다면 false bool 값을 반환하도록했다.
>이로 인해 모든 몬스터를 처치했을 때 몬스터 리스트가 비게 되어 battle을 지속하는 while 문에서 빠져나올 수 있도록 하였다.
>다음은 고친 코드 부분이다.
>'''
>void startGame() {//게임을 시작하고 종료하는 메서드
      while (character.health > 0 && monsters.isNotEmpty) {//몬스터 리스트 비었을때 false인 bool type 변수가 된다.
        battle();
        if (character.health <= 0) {//캐릭터 체력 0되면 종료
          print("캐릭터가 쓰러졌습니다. 게임 종료.");
          saveResult(character, "패배");
          break;
        }
        if (monsters.isEmpty) {//몬스터 리스트가 빔 == 모든 몬스터를 뭄리침
          print("모든 몬스터를 물리쳤습니다. 승리!");
          saveResult(character, "승리");
          break;
        }
        print(" ");
        print("다음 몬스터와 싸우시겠습니까? (y/n)");
        String choice = stdin.readLineSync() ?? 'n';
        if (choice.toLowerCase() != 'y') {
          break;
        }
      }
>'''
