$(document).ready(function(){
  createIdea();
  });

function renderIdea(idea){
  $('#latest-ideas').append(
    "<div class='idea'><h6>Published on "+
    idea.created_at +
    "</h6><p><em>" +
    idea.title +
    "</em></p><p>" +
    idea.body +
    "</p><p>" +
    idea.quality +
    "</p></div>"
  );
}

function createIdea(){ 
  $("#create-idea").on('click',function(){
    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    };
  
  $.ajax({
    type: 'POST',
    url:  '/api/v1/ideas',
    data: ideaParams,
    success: function(newIdea){
      renderIdea(newIdea);
    },
    error: function(xhr){
      console.log(xhr.responseText);
    }
  });
});
}