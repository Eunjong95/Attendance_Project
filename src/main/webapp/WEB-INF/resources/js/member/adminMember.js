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
				console.log(result);
				console.log(prePage);
				result.forEach((value,index)=>{
					var memberNum=(mPage-1)*5+(index+1);
					if(value.todayStatus==null){
						value.todayStatus="미출석";
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