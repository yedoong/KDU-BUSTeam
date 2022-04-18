$(function(){
    $("#confirm").click(function(){
        modalClose();
        //컨펌 이벤트 처리
    });
    $("#modal-open-1").click(function(){        $("#popup").css('display','flex').hide().fadeIn();
    });
    $("#modal-open-2").click(function(){        $("#popup").css('display','flex').hide().fadeIn();
    });
    $("#modal-open-3").click(function(){        $("#popup").css('display','flex').hide().fadeIn();
    });
    $("#modal-open-4").click(function(){        $("#popup").css('display','flex').hide().fadeIn();
    });
    $("#close").click(function(){ // 닫는거
        modalClose();
    });
    function modalClose(){ // 천천히 닫히는 거
      $("#popup").fadeOut();
    }
  });

  
