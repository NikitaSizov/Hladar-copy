Slider = function(image, links, cb_cont){
	this.image = image;
	this.links = links;
	this.checkboxes_container = cb_cont;
	this.checkboxes = [];
	this.stepTime = 3000;
	context = this;
	var active;
	for (var i = 0; i < links.length; i++) {
		this.checkboxes.push($("<span>"+ i +"</span>"));
		this.checkboxes_container.append(this.checkboxes[i]);
	};
	$(this.checkboxes_container).find("span").click(function(e){
		e.preventDefault();
		console.log($(e.target).text());
		context.setActive(parseInt($(e.target).text()));
	});
	this.start = function(){
		this.active = 0;
		this.setActive(0);
		this.step();
	}
	this.step = function(){
		context.next();
		setTimeout(context.step, context.stepTime);
	}
	this.setActive = function(index){
		this.checkboxes[this.active].removeClass("active");
		this.active = index;
		this.checkboxes[this.active].addClass("active");
		this.image.css("background-image", "url("+this.links[index]+")");
	}
	this.next = function(){
		if(context.active==context.links.length-1) context.setActive(0);
		else context.setActive(context.active+1);
	}
}
$(document).ready(function(){
	$(window).load(function() {
    setTimeout(function() {
      $('#preloader').fadeOut('slow', function() {});
    }, 1000);

  });

	links = [];
	checkboxes_container = $(".checkboxes");
	$("#main-photo").find(".images").find("a").each(function(index, element){
		links.push($(element).attr("href"));
	});
	slider = new Slider($(".image-container"), links, checkboxes_container);
	slider.start();
});
