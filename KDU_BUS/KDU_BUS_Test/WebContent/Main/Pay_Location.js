
console.dir(navigator)

window.onload = getLocation;

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
	
	var arr = [];
	var brr = [];
	
	//정렬 그룹화
	for(i=0 ; i<sort_bus_station.length; i++){
		if(sort_bus_station[i].name == "하남" | "천호" | "잠실"){
			arr[i] = "하남, 천호, 잠실 (왕복권)";
			brr[i] = "5,000";
		}else if(sort_bus_station[i].name == "구리" | "남양주"){
			arr[i] = "구리, 남양주 (왕복권)";
			brr[i] = "4,400";
		}else if(sort_bus_station[i].name == "일산" | "일산_경유지"){
			arr[i] = "일산 (왕복권)";
			brr[i] = "6,000";
		}
	}
	
	//arr[] 중복값 제거
	var sort_arr = arr.filter(function(item,index){
		return arr.indexOf(item) === index;
	});
	
	//brr[] 중복값 제거
	var sort_brr = brr.filter(function(item,index){
		return brr.indexOf(item) === index;
	});
	
	//Pay_SelBus.jsp 에 버스, 가격 출력
	$("#bus_station1").html(sort_arr[0]);
	$("#bus_station1").val(sort_arr[0]);
	$("#bus_station2").html(sort_arr[1]);
	$("#bus_station2").val(sort_arr[1]);
	$("#bus_station3").html(sort_arr[2]);
	$("#bus_station3").val(sort_arr[2]);
	
	$("#bus_pay1").html(sort_brr[0]);
	$("#bus_pay1").val(sort_brr[0]);
	$("#bus_pay2").html(sort_brr[1]);
	$("#bus_pay2").val(sort_brr[1]);
	$("#bus_pay3").html(sort_brr[2]);
	$("#bus_pay3").val(sort_brr[2]);
	
}


function goPage1() {
	let bus_station1 = document.getElementById("bus_station1").value;
	let bus_pay1 = document.getElementById("bus_pay1").value;
	location.href="Pay_SelDate.jsp?pay_bus_location=" + bus_station1 + "& pay_bus_price=" + bus_pay1;
}
function goPage2() {
	let bus_station2 = document.getElementById("bus_station2").value;
	let bus_pay2 = document.getElementById("bus_pay2").value;
	location.href="Pay_SelDate.jsp?pay_bus_location=" + bus_station2 + "& pay_bus_price=" + bus_pay2;
}
function goPage3() {
	let bus_station3 = document.getElementById("bus_station3").value;
	let bus_pay3 = document.getElementById("bus_pay3").value;
	location.href="Pay_SelDate.jsp?pay_bus_location=" + bus_station3 + "& pay_bus_price=" + bus_pay3;
}


//위치 거부
function fail(){
	var errorTypes = {
		0: "알려지지 않은 에러",
        1: "사용자가 권한 거부",
        2: "위치를 찾을 수 없음",
        3: "요청 응답 시간 초과"
	};
	
	var errorMessage = errorTypes[error.code];
    if (error.code == 0 || error.code == 2) {
        errorMessage = errorMessage + " " + error.message;
    }
    $("#bus_station1").html(errorMessage);
	$("#bus_station2").html(errorMessage);
	$("#bus_station3").html(errorMessage);
}

//현재위치정보 받기
function getLocation() {
	navigator.geolocation.getCurrentPosition(success, fail)
	
	if(!navigator.geolocation){
		alert("오류 또는 위치 정보제공 설정이 꺼져있음");
	}
}