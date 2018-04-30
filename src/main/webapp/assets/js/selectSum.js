var selectSum = function(){
			var minSum = 0
			var maxSum = 50
			var sumSel = document.getElementsByClassName("selSum")
	
			for(var i=0;i<sumSel.length;i++){
				for(var y = maxSum;y >= minSum;y--){
					var sumOpt = document.createElement('option')
					sumOpt.value = y
					sumOpt.innerHTML = y+'次'
					sumSel[i].appendChild(sumOpt)
				}
			}
			$(".selSum").click(function(event){
				if(!$(this).val()) return;
			})


			function addOption(num,unit,parent){
				//num：选项个数
				//unit：单位（年/月/日）
				//parent：父对象
				for(var index=1;index <= num;index++){
					var opt =document.createElement('option')
					$(opt).attr('value',index)
					if(index<10){index = '0'+index}
					$(opt).html(index+unit)
					$(parent).append(opt)
				}
			}
			
			function removeOption(parent){
				//parent：父对象
				var options = $(parent).find('option')
				for(var index = 1;index < options.length;index++){
					parent.removeChild(options[index])
				}
			}
		}