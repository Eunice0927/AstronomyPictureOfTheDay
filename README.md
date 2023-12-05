# AstronomyPictureOfTheDay
Pick a date to see the astronomy picture of the day

## 프로젝트 개요
- [Nasa API](https://api.nasa.gov/)를 사용한 뷰를 만들었습니다.
- Api에서 copyright, date, explanation, mediaType, title, url을 가져옵니다.
- 프로젝트에 배경 이미지 asset이 추가되었습니다.
- 날짜를 선택하고 "Go" 버튼을 누르면 DetailView로 연결됩니다.
- ContentView의 배경 이미지가 가로로 이동하는 애니메이션이 적용되었습니다.
- DetailView의 AsyncImage가 로딩되는 동안 placeholder에 크기가 변하는 동그라미 이미지가 보입니다.
- api의 mediaType이 video라면 WebKit을 사용한 뷰를 그립니다.
- DetailView 하단의 사진 설명은 ScrollView입니다.

## ScreenShots
|설명|이미지|GIF|
|:-:|:-:|:-:|
|홈 뷰|<img width="210" alt="홈 뷰" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/a471ab21-f064-40b7-891c-647e51ddf3db">|<img width="210" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/9c5655bd-f6f6-4d46-beda-6970446765df">|
|디테일 뷰: 로딩|<img width="210" alt="디테일 뷰 이미지 로딩 애니메이션" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/e7eb148e-ce46-4d08-baa3-dc5b155b36a9">|<img width="210" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/e4145adb-8749-4596-8024-396b821405c9">|
|디테일 뷰: 이미지|<img width="210" alt="디테일 뷰: 이미지" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/74673018-90e8-426c-b6b5-415d46b1a56b">|<img width="210" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/1a84bc22-44fb-4149-a855-b9aba5f0bbe2">|
|디테일 뷰: 비디오|<img width="210" alt="디테일 뷰: 비디오" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/ad7a33e3-189e-4940-ba19-d255f2dbb8a5">|<img width="210" src="https://github.com/Eunice0927/AstronomyPictureOfTheDay/assets/106911494/b1b6aac7-eee4-4e30-8e94-30103b441f89">|

## 추가 Develop하고싶은 내용
- [ ] 북마크 기능
