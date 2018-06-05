$(document).on('turbolinks:load', function() {
	var path = location.pathname ;
	
	if (path == "notes/new"){
	title = $("#note_title").val();
	content = $("#note_content").val();

	$("#view_title").text(title);

	content = content.replace(/\r\n/g, "<br />").replace(/(\n|\r)/g, "<br />");

	$("#view_text").html(content);
	}

  $("form").change(function(){
	if (path == "notes/new"){
	title = $("#note_title").val();
	content = $("#note_content").val();

	$("#view_title").text(title);

	content = content.replace(/\r\n/g, "<br />").replace(/(\n|\r)/g, "<br />");

	$("#view_text").html(content);
	}
	
  });


 });

