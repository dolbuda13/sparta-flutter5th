class Solution {
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    List<bool> result =[];
    int large =0;
    for(int i=0;i<candies.length;i++){ // list에서 가장 큰 캔디값 구하기
        if(candies[i] > large){
       large = candies[i];
    }
    }
    
       for(int i=0;i<candies.length;i++){
        if((candies[i] + extraCandies) >= large){ //list에 각각 extracandies 값을 더하여 모든 리스트 값과 비교, 크다면 true return, 작다면 false return
            
            result.add(true);
        }else{
            result.add(false);
        }
    }
    return result;
  }
}
//map과 tolist를 이용하는 빠른 방법도 있으나 아직 다트 문법에 익숙하지 않아 떠올리지 못함.
