var mPage=1;
var prePage=1;
function getMemberList(){
	var scroll = $("#memberWraper");
	var table = $("#memberList");
	//console.log(scroll.scrollTop()+scroll.height()+" , "+table.height());
	if(scroll.scrollTop()+scroll.height()+1>=table.height()&&prePage===mPage){
		
		mPage+=1;
		$.ajax({
			url:"/myapp/admin/memberList/"+mPage,
			type:"GET",
			success:function(result){
				prePage=mPage;
				//console.log(result);
				result.forEach((value,index)=>{
					var memberNum=(mPage-1)*5+(index+1);
					
					
					if(value.todayStatus==null)
					{
						value.todayStatus="미출석";
					}
					if(value.todayStatus==0)
					{
						value.todayStatus="정상출근";
					}
                  	if(value.todayStatus==1){
                  		value.todayStatus="결근";
                  	}
                  	if(value.todayStatus==2){
                  		value.todayStatus="지각";
                  	}
                  	if(value.todayStatus==3){
                  		value.todayStatus="휴가";
                  	}
                  	if(value.todayStatus==4){
                  		value.todayStatus="조퇴";
                  	}
                  	if(value.todayStatus==5){
                  		value.todayStatus="출근중";
                  	}
					$("#memberList tbody").append(
							"<tr>" +
							"	<td>"+memberNum+"</td>" +
							"	<td>"+value.userName+"</td>" +
							"	<td>"+value.lectureName+"</td>" +
							"	<td>"+value.todayStatus+"</td>" +
							"</tr>"
					);
				});
			}
		});
	}
}