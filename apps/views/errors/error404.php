<div class="content">
	<div class="box">
		Redirecting in <span id="timeLeft">5</span> seconds.<br/><br/>
		The page you are looking for can not be found.<br/>	
		If you are logged in, you will be redirected to your account home page. If you are not logged in, you will be redirected to the login screen.
	</div>
</div>

<script><!--
$(document).ready(function() {  
    window.setInterval(function() {
    var timeLeft = $("#timeLeft").html();                                
        if(eval(timeLeft) == 0){
                window.location= ("<?php echo base_url(); ?>");                 
        }else{              
            $("#timeLeft").html(eval(timeLeft)- eval(1));
        }
    }, 1000); 
});
--></script>