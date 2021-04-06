# 나 혼자 산다
<p align="center"><img src="/src/main/webapp/resources/images/logo/logo.png" width="200" height="200"></p>   
<p align="center">자취생들을 위한 종합 웹커뮤니티 서비스입니다.</p>

### :busts_in_silhouette:팀원
<a href="https://github.com/junu0516/ILIVEALONE_2/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=junu0516/ILIVEALONE_2" />
</a>

- [권석호](https://github.com/ksh950329) : 회원관리 서비스 구현
- [남궁수영](https://github.com/ngsy) : 중고거래 서비스 구현
- [배채은](https://github.com/baechaeeun) : 부동산 매물 거래 서비스 구현
- [윤우진](https://github.com/dbsrkrnd) : 주제별 커뮤니티 게시판 서비스 구현
- [이준우](https://github.com/junu0516) : 공동구매 서비스 구현   

**** 각종 이슈 발생에 대한 __팀원 간 커뮤니케이션 과정__ 은 [여기](https://github.com/junu0516/ILIVEALONE_2/issues)를 참고해주세요   
**** 학원에서 공통으로 배운 것 외에, __개인적으로 학습하여 프로젝트에 적용한__ 부분은 [위키](https://github.com/junu0516/ILIVEALONE_2/wiki)를 확인해주세요   


### :computer:사용 기술
- Version Control : Git & Github
- Framework & Language(Backend) : Java & Spring
- Frontend : Bootstrap, JSP(HTML,CSS,Javascript)
- Database : Oracle, MyBatis
- Server : Tomcat (v.8.5)   
- IDE : Eclipse

### :point_right: 프로젝트 내려받는법
1. 현재 보고있는 ILIVEALONE_2 저장소를 본인의 로컬환경에 clone 합니다.(Clone Repository)
2. 이클립스를 열고 clone한 저장소를 'Maven Project'로 import합니다.
3. 자동으로 실행환경이 업데이트되면, 톰캣 8.5를 설치하여 프로젝트를 서버에 등록해줍니다.
4. 이후 저장소에 있는 sql 파일의 DDL 문을 오라클에서 실행하여 사용할 테이블, 시퀀스를 모두 생성합니다.
5. 서버와 DB설정이 끝났다면 서버실행 후, localhost:(본인의 톰캣 서버 포트번호)/spring으로 접속하여 화면이 정상적으로 나타는지 확인합니다.

### 💻 핵심 기능 
- 회원관리 : 로그인/ 회원가입/ 회원정보 수정 및 탈퇴 
- 중고거래 : 거래 게시물 등록 / 거래 게시물 상세 조회 및 수정 / 원하는 거래방식 선택 / 판매자-구매자 간 채팅
- 부동산 : 지도상에서 매물 위치 조회 / 전체 매물 리스트 조회 / 매물 상세정보 조회 및 수정 / 원하는 매물 찜하기
- 커뮤니티 : 주제별 게시물 등록 / 게시물 상세 조회 및 수정 / 실시간 인기 게시물 조회
- 공동구매 : 거래 게시물 등록 / 거래 게시믈 상세 조회 및 수정 / 거래 관리 / 거래 마감 후 메시지 발송   

### 👀 세부 기능 설명
// 움짤

###  💬 수정 & 업데이트 내역
2021.04.07 : 기본 UI / 기능 완성 (4.8 KH정보교육원 전원수료)
