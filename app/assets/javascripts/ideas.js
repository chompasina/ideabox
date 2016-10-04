$(document).ready(function(){
  function renderIdea(idea){
    $('#latest-ideas').append(
      "<div class='idea'><h6>Published on "+
      idea.created_at +
      "</h6><p>" +
      idea.title +
      "</p></div>"
    );
  }

    $.ajax({
      url: "localhost:3000/api/v1/ideas.json",
      type: "get",
      success: function(ideas){
        $.each(ideas, function(index, idea){
          renderIdea(idea);
        });
      }
    });
  
  function handleError(error){console.log(error);}
  
  $("#create-idea").on('click',function(){
    var ideaParams = {
      idea: {
        title: $("#idea-title").val(),
        body: $("#idea-body").val()
      }
    };
  });
  
  $.ajax({
    type: 'POST',
    url:  'localhost:3000/api/v1/ideas.json',
    data: ideaParams,
    success: function(newIdea){
      renderIdea(newIdea);
    },
    error: function(xhr){
      console.log(xhr.responseText);
    }
  });
});
