<html lang="ko">
<head>
    <meta charset="UTF-8">
</head>
<body>

<!-- 이걸 팝업창으로 띄우면됨 + get써서 DB에서 기사님 인증번호 인증하면 될듯 !! 지금은 그냥 대충 비밀번호 1234로 해놓기만 했다능 -->

	<?php
		$password = $_GET["password"];
		if($password==1234)
			echo("인증되었습니다.");
		else
			echo("다시 입력해주세요.");
	?>
</body>
</html>