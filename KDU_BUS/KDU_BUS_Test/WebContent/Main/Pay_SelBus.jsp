<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KDU 셔틀버스</title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="Pay_SelBus.css">
    <link rel="stylesheet" href="Reset.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/db7203ef58.js" crossorigin="anonymous"></script>
</head>
<body>

	<script>
		console.dir(navigator)
		
		//셔틀 탑승지 리스트
		let bus_station = [
			{name: "하남", latitude:37.54127490602136, longitude:127.20825318566752},
			{name: "천호", latitude:37.537822341696064, longitude:127.12268778884908},
			{name: "잠실", latitude:37.51461573560594, longitude:127.10282415101861},
			{name: "구리", latitude:37.60308742599663, longitude:127.14332062240064},
			{name: "남양주", latitude:37.642067068661085, longitude:127.12697198024249},
			{name: "일산", latitude:37.64562194901713, longitude:126.80153474287756},
			{name: "일산_경유지", latitude:37.64315370624365, longitude:126.78756500246655}
		];
		
		//거리계산함수
		function getDistance(lat1, lon1, lat2, lon2, unit){
			var radlat1 = Math.PI * lat1/180;
			var radlat2 = Math.PI * lat2/180;
			var radlon1 = Math.PI * lon1/180;
			var radlon2 = Math.PI * lon2/180;
			var theta = lon1-lon2;
			var radtheta = Math.PI * theta/180;
			var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
			dist = Math.acos(dist);
			dist = dist * 180/Math.PI;
			dist = dist * 60 * 1.1515;
			if (unit=="K") { dist = dist * 1.609344 }
			if (unit=="N") { dist = dist * 0.8684 }
			return dist;
		}
				
		//위치 허용
		function success(position){
			//위도 경도 받아오기
			let latitude = position.coords.latitude;
			let longitude = position.coords.longitude;
			
			//내 위치 표시 - 콘솔에 표시하는거라 지워도됨 (확인용)
			console.log(latitude, longitude);
			
			//현재위치 - 셔틀버스탑승지 거리계산
			for(let i=0; i<bus_station.length; i++){
				let distance = getDistance(latitude, longitude, bus_station[i].latitude, bus_station[i].longitude, "K");
				bus_station[i].distance = distance;
			}
			
			//거리순으로 정렬
			let sort_bus_station = bus_station.sort(function (a,b){
				if(a.distance > b.distance){
					return 1;
				}
				if(a.distance < b.distance){
					return -1;
				}
				return 0;
			});
			
			//전체 정렬
			for(i=0 ; i<sort_bus_station.length; i++){
				console.log(sort_bus_station[i].name);
			}			
			
			
			for(i=0 ; i<sort_bus_station.length; i++){
				if(sort_bus_station[i].name == "하남" | "천호" | "잠실"){
					console.log("하남, 천호, 잠실");
				}else if(sort_bus_station[i].name == "구리" | "남양주"){
					console.log("구리, 남양주");
				}else if(sort_bus_station[i].name == "일산" | "일산_경유지"){
					console.log("일산");
				}
			}

		}
		
		//위치 거부
		function fail(){
			
		}
		
		//현재위치정보 받기
		(function() {
			navigator.geolocation.getCurrentPosition(success, fail)
		})()
	
	</script>

    <div id="wrapper">
        <header> <!-- s: header -->   
                <h1>경동대 셔틀버스</h1> 
         </header> <!-- e: header -->

         <nav> <!-- nav -->
            <div id="bg">
                <img src="kdu_cam.jpg" alt="캠퍼스 사진">
            </div>
        </nav>  

        <div id="line_title">
            <div id="line_1" style="width: 100%; height: 23px; background-color: rgb(224, 224, 224);"> <!-- line -->
                <div id="text_box">
                    <i class="fa-solid fa-heart" style="color: rgb(192, 57, 43);"></i>
                    <p>추천순</p>
                </div>
            </div>
        </div>

        <div id="bus_1">
            <a href="./Pay_SelDate.html">
                <h2>구리,남양주 (왕복권)</h2>
                <h3>4,400</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        <div id="bus_2">
            <a href="./Pay_SelDate.html">
                <h2>하남,천호,잠실 (왕복권)</h2>
                <h3>5,000</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        <div id="bus_3">
            <a href="./Pay_SelDate.html">
                <h2>일산 (왕복권)</h2>
                <h3>6,000</h3>
            </a>
            <div id="line_1" style="width: 100%; height: 2px; background-color: rgb(224, 224, 224);"></div>
        </div>
        
        <footer>
            <div id="Explain">
                <h4>사용자의 현재 위치를 기반으로 가장 가까운 셔틀버스 탑승지를 최상단에 고정하여 추천해드립니다! :) </h4>
            </div>
            <a href="./Pay_Mypage.jsp"><button id="mypage">마이페이지</button></a>
        </footer>
    </div>
</body>
</html>
