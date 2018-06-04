$(document).on('turbolinks:load', function() {
  $("form").change(function(){
	title = $("#note_title").val();
	content = $("#note_content").val();

	$("#view_title").text(title);
	$("#view_text").text(content);

  });
 });