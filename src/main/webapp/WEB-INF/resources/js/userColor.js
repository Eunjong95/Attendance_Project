$(document).ready(function(){
	
	if($(".bg-gradient-warning").length){
		
		$(".bg-gradient-primary").addClass("bg-gradient-warning");
		$(".bg-gradient-warning").removeClass("bg-gradient-primary");
		$(".border-left-primary").addClass("border-left-warning");
		$(".border-left-warning").removeClass("border-left-primary");
		
		$(".btn-primary").addClass("btn-warning");
		$(".btn-warning").removeClass("btn-primary");
		
	}
	
});