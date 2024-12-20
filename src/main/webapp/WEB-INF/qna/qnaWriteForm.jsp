<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/qna/qnaWrite.css">
</head>
<body>
		<div id="post_content_div">
        <br/>
        <form method="post" id="write_form">
                <div align="center">
                    <h2>문의글 등록</h2>
                </div>
                <div id="post_input">
                	<div class="custom-form-group2">
                        <label>
	                        <input type="checkbox" id="qnaCheck" name="qnaCheck" value="T" style="display: inline; margin-right: 5px;">
							<input type="hidden" name="qnaCheck" value="F">
	                        비밀글 설정
	                    </label>
                    </div>
                    <div class="custom-form-group2">
	                    <input type="text" class="custom-form-control2" id="qnaId" name="qnaId" value="${userId }" readonly>
	                </div>
                    <div class="custom-form-group2">
                        <textarea class="custom-form-control2" id="qnaUserContent" name="qnaUserContent" placeholder="내용을 입력해주세요"></textarea>
                    </div>
                </div>
                
                <div align="center">
                    <input type="button" value="등록" id="write_button" class="btn"/>
                    <input type="reset" value="다시 입력" id="reset_button" class="btn"/>
                    <input type="button" value="목록" id="list_button" onclick="window.history.back();" class="btn"/>
                </div>
        </form>
    </div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('#write_button').click(function() {
    const content = $('#qnaUserContent').val();

    // 체크박스 상태에 따라 값을 설정
    const qnaCheckValue = $('#qnaCheck').is(':checked') ? 'T' : 'F'; // T 또는 F 설정
    $('input[name="qnaCheck"]').val(qnaCheckValue); // 체크박스 값을 설정

    console.log($('#write_form').serialize()); // 직렬화된 데이터 출력

    if (!content) {
        $('#qnaUserContent').focus();
        alert("내용을 입력해주세요.");
    } else {
        // AJAX 요청을 보냅니다.
        $.ajax({
            type: 'POST',
            url: '/BooBooBookProject/qna/qnaWrite', 
            data: $('#write_form').serialize(), // 직렬화된 데이터 전송
            success: function() {
                alert("게시글이 등록되었습니다.");
                location.href = "/BooBooBookProject/qna/qnaList";
            },
            error: function(xhr, status, error) {
                console.log("Error Status: " + status);
                console.log("Error: " + error);
                console.log("XHR: " + xhr.responseText);
                alert("게시글 등록에 실패했습니다.");
            }
        });
    }
});
</script>



   
</html>