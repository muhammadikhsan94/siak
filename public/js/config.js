"use strict";

/**
 * CSRF Setup untuk AJAX Post
 */
$.ajaxSetup({
	headers: {
		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	}
});

/**
 * Sweetalert handler
 * @param {Jenis Alert : success, error, warning, info} icon 
 * @param {Judul Pesan} title 
 * @param {Text} text 
 */
function sweetalert(icon, title, text = '', button = true){
	var options = {
		icon: icon,
		title: title,
		text: text,
		button: button,
	  };
	if(button ==  false)
	  options.timer = 2000;
	swal(options);
}

/**
 * Action handler untuk Submit data melalui AJAX
 * @param {Ajax URL} url 
 * @param {Data yang akan di-POST} data 
 * @param {Nama alias datatable target, opsional} targetTable 
 * @param {ID modal sumber, opsional} modalsource 
 */
function ajaxSubmit(url, data, targetTable = '', modalsource = '', table2 = ''){
	$.ajax({
	  type: 'POST',
	  url: url,
	  data: data,
	  success: function(result) {
		if(result == 'success'){
			sweetalert('success', "Sukses", "", false);
			if(targetTable !== '')
				targetTable.ajax.reload(null, false);
			if(modalsource !== '')
				$("#"+modalsource).modal("hide");
			if(table2 !== '')
				table2.ajax.reload(null, false);
		}
		else
		  sweetalert('error', result);
	  }
	});
}


/**
 * Action handler untuk Hapus record pada serverside datatable
 * @param {Ajax URL} url
 * @param {Nama alias dari datatable target yang akan direload} table
 */
function ajaxDelete(url, table = '', table2 = ''){
	swal({
		title: "Apakah Anda yakin akan menghapus data ini?",
		text: "",
		icon: "warning",
		dangerMode: true,
		buttons: ["Batal", "Ya!"],
	}).then(function(isConfirm) {
		if (isConfirm) {
			$.ajax({
				type:'DELETE',
				url:url,
				success:function(msg){
					if(msg=='success'){
						sweetalert('success', msg);
						if(table !== '')
							table.ajax.reload(null, false);
						if(table2 !== '')
							table2.ajax.reload(null, false);
					}
					else
						sweetalert('error', msg);
				}
			});
		}
	});
}

/**
 * Action handler untuk Hapus record pada Form Delete
 */
$(document).on("click", ".btn-destroy", function(){
	var form = $(this).parents('form');
	swal({
		title: "Apakah Anda yakin akan menghapus data ini?",
		text: "",
		icon: "warning",
		dangerMode: true,
		buttons: ["Batal", "Ya!"],
	}).then(function(isConfirm) {
		if (isConfirm) {
			form.submit();
		}
	});
});

function ajaxOptions(url, select){
	select.find('option').remove();  
	$.ajax({
		type:'GET',
		datatype:'json',
		url: url ,
		success:function(data){
			select.append('<option value=""></option>');
			$.each(data,function(key, value){
				select.append('<option value=' + key + '>' + value + '</option>');
			});
		}
	});
}