$(document).ready(function(){
  renderIdeaList();
  createIdea();
  clearFields();
  deleteIdea();
  });
  
function renderIdeaList(){
  $.ajax({
    type: 'GET',
    url: 'api/v1/ideas',
    dataType: 'JSON'
  })
  .then(collectIdeas);
}

function collectIdeas(ideaList){
  ideaList.map(function(idea){
    renderIdea(idea);
  });
}

function clearFields() {
  document.getElementById("idea-title").value = "";
  document.getElementById("idea-body").value = "";
}

function renderIdea(idea){
  var shortBody = shortenBody(idea);
  $('#latest-ideas').prepend(
    "<div class='idea' data-id='" +
    idea.id + 
    "'><h6>Published on "+
    idea.created_at +
    "</h6><p><em>" +
    idea.title +
    "</em></p><p>" +
    shortBody +
    "</p><p>" +
    idea.quality +
    "</p>" +
    "<button id='delete-idea' name='button-fetch' class='btn btn-default btn-xs'>Delete</button>" +
    "</div>"
  );
}

function deleteIdea(idea){
  $('#latest-ideas').on('click', '#delete-idea', function(){
    var $idea = $(this).closest(".idea");
    
    $.ajax({
      type: 'DELETE',
      url: 'api/v1/ideas/' + $idea.data('id') + ".json"
    }).then(function(){
      $idea.remove();
    }).fail(handleError);
  });
}

function handleError(xhr){
  console.log(xhr.responseText);
}

function shortenBody(idea){
  var count = 0;
  var description = idea.body.split(' ');  
  description.filter(function(word) {
    count += word.length;
    return count <= 100;
  });
  return description.join(' ');
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
  clearFields();
});
}