$(document).ready(function(){
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
      likeBtn.innerHTML = "<div id='content_footer_like_button'><i class='fa fa-heart-o fa-2x'></i></div>"
      flagTxt = "not"
    }else{
      likeBtn.innerHTML = "<div id='content_footer_like_button'><i class='fa fa-heart fa-2x'></i></div>"
      flagTxt = "already"
    }
     $.ajax({
            url: url, 
            type: "POST",
          })
          .done(function(data){ 
            console.log("suceess");
          })
          .fail(function(){
            console.log("fail");
          })
   })
});
