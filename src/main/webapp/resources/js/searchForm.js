 $(document).ready(function(){
    	
    	const searchForm=$("#searchForm");
		$("#searchButton").on("click",function(e){
			
			//선택된 option값 읽기
			if(!searchForm.find("input[name='keyword']").val()){
				//sweetalert2 사용
				Swal.fire({
					  title: 'Error!',
					  text: '키워드를 입력하세요',
					  icon: 'error',
					  confirmButtonText: 'OK'
					})
				return false;
			}
			//pageNum에 값 1 넣기
			searchForm.find("input[name='pageNum']").val("1");
			searchForm.find("input[name='amount']").val("6");
			e.preventDefault();
			
			
			searchForm.submit();
		});
    });