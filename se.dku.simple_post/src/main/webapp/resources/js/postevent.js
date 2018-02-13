/* postevent.js - Javascript파일*/

/*
//게시물 작성 화면(writepost.jsp)에서 input태그 안에 입력되는 내용이 없을경우 경고창을 띄우는 함수
function formCheck(){
	var length = document.forms[0].length-1; //submit을 제외한 모든 input태그의 갯수를 가져옴
	for(var i=1; i<length; i++){ //i=1인 이유는 type이 hidden인 첫 번째 input태그는 검사안하기 위해서
		if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
			alert(document.forms[0][i].name + "을/를 입력하세요.");
			document.forms[0][i].focus(); //null인 태그에 포커스를 줌
			return false;
		} //end if
		else{
			alert('완료되었습니다'); location.replace('index.jsp');
			return true;
		} //end else
	} //end for
} //end function
*/