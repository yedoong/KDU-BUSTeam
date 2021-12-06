<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
    <link rel="stylesheet" href="./css/drive_login.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
     <div id="wrapper"><!-- s: wrapper -->
        <header> <!-- s: header -->
            <div id="login_logo"> <!-- s: login_logo -->
                <h1>
                    <img src="./img/login_logo.jpg" alt="로그인메인페이지로고"> <!-- 서버 수정 후, 로그인 이미지 경로 수정 필요 -->
                </h1>
            </div> <!-- e: login_logo -->
        </header> <!-- e: header -->

        <nav> <!-- s: nav -->
            <div id="login_box"> <!-- s: login_box -->
                <div id="login_txt"> <!-- login_txt -->
                    <p>
                        사전에 안내된 인증번호를 입력해주세요. <br>
                        이용해 주셔서 감사합니다.
                    </p>
                </div>
                <form action = next.php>
                     <div id="main_login"> <!-- main_login -->
                        <input type="password" name="password" id="password" placeholder="인증번호를 입력해주세요.">
                    </div>
                    <div id="login_sign_up"> <!-- login_sign_up -->
                        <button type="submit" id="signUpBtn"> 인증하기</button>
                    </div>

                </form>

            </div> <!-- e: login_box -->
        </nav> <!-- e: nav -->
    </div><!-- e: wrapper -->
</body>
</html>