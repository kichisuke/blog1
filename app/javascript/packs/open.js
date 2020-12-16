$(document).ready(function(){
  console.log("sss");
  var flagTxt = document.getElementById("content_footer_like_flag").innerHTML.replace(/\r?\n/g, '')
  var likeBtn = document.getElementById("content_footer_like_button")
  var id = location.href.split("/").slice(-1)[0]
  var url = '/blogs/' + id + '/likes'
  
  if(flagTxt == "already") {
    likeBtn.innerHTML = "<div id='content_footer_like_button'><i class='fa fa-heart fa-2x'></i></div>"
  } else{
  }
  
   $('#content_footer_like_button').on('click', function(e){
    e.preventDefault(); 
    if(flagTxt == "already") {
      setTimeout(funcunlike, 1000);
        function funcunlike(){
          likeBtn.innerHTML = "<div id='content_footer_like_button'><i class='fa fa-heart-o fa-2x'></i></div>"
          flagTxt = "not"
      }
    }else{
      setTimeout(funclike, 1000);
        function funclike(){
          likeBtn.innerHTML = "<div id='content_footer_like_button'><i class='fa fa-heart fa-2x'></i></div>"
          flagTxt = "already"
      }
    }
     $.ajax({
            url: url, 
            type: "POST",
          })
          .done(function(data){ 
          })
          .fail(function(){
            console.log("fail");
          })
   })
});
