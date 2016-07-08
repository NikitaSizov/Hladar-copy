$(document).ready(function(){
	$("section").each(function(index, element){
		page_name = $(element).attr("id");
		$("section#"+page_name).load(page_name + ".html");
	});
	//$("section#"+page_name).load(page_name + ".html");
});