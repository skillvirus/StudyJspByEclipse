var click_btn = document.getElementById('click_btn');
click_btn.addEventListener('click', click_event);

function click_event() {
	alert("외부 JS 파일을 이용한 팝업창 호출");
}