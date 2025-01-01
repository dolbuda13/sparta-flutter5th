I/flutter (25314): Error fetching movie list: type 'Null' is not a subtype of type 'num' in type cast
===============================
![image](https://github.com/user-attachments/assets/e7a13148-0d71-41f1-aaa3-d38787be530f)
![image](https://github.com/user-attachments/assets/e9f815ef-6bf8-4e71-a46a-877c77d89e3e)
와 같은 오류가 계속 나면서 페이지에 이미지 바인딩을 하지 못하였다.
다음은 시도해보았지만 실패한 것들이다.

movie_repository_impl에서 null값 처리
------------

'''
    return response.results!.map((dto) {
      return Movie(
        id: dto.id,
        posterPath: dto.posterPath ?? '', // null일 경우 빈 문자열로 처리
      );
'''

DTO 클래스에서 null 처리
-------------------
movie_response_dto.dart와 movie_detail_dto.dart에서 모든 필드에 null 처리를 추가

homepage에서 movie가 null인지 검사
-------------------------
'''
if (movie == null) {
  return const Center(child: CircularProgressIndicator());
}
return Text(movie.title);
'''

viewmodel의 데이터 초기화 확인
-----------