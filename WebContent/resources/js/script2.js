$(document).ready(function()
{
	$(".alert").hide();
	
	
	$("#password").keyup(function()
			{
				
				if($("#password").val().length>=8)
				{
					$("#password_text").text("Strong password").removeClass("text-danger").addClass("text-success");
					$('form > div:eq(1)').removeClass("has-error has-feedback").addClass("has-success has-feedback");
					$('#password_feedback').removeClass("glyphicon-warning-sign").addClass("glyphicon-ok");
				}

				else
				{
					$("#password_text").text("Weak password").removeClass("text-success").addClass("text-danger");
					$('form > div:eq(1)').removeClass("has-success has-feedback").addClass("has-error has-feedback");
					$('#password_feedback').removeClass("glyphicon-ok").addClass("glyphicon-warning-sign");
				}
			});
	
	$("#cpassword").keyup(function()
			{
		if(	$("#cpassword").val()==$("#password").val())
			{
			$("#password_text2").text("Passwords match").removeClass("text-danger").addClass("text-success");
				$('form button[type="submit"]').removeAttr("disabled");
				
			}
			else
			{
				$("#password_text2").text("Passwords do not match").removeClass("text-success").addClass("text-danger");
				$('form button[type="submit"]').attr("disabled","disabled");
			}
			
		
			});
	
	
	
});