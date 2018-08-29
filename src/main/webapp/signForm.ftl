<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	  <!--Angular -->
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <link type="text/css" rel="stylesheet" href="/css/bcPaint.css"/>
	  <link type="text/css" rel="stylesheet" href="/css/bcPaint.mobile.css"/>

	  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	  <script type="text/javascript" src="/js/bcPaint.js"></script>
      <!--  <link rel="stylesheet" href="../css/global.css"  type="text/css" > -->
      
      <title>Complaining form</title>

      	<style type="text/css">
			
			@media (max-width: 1024px){
				body{
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
					position: fixed;
					border: 1;
					
				}

				#container{
					background-color: #f7f7f7;
				}

				#container h4{
					font-size: 18px;
				}

				#container h3{
					font-size: 32px;
					margin: 15px 0;
				}

				#container > #middle > #features{
					display: none;
				}

				#container > #middle{
					width: 100%;
					height: calc(100% - 270px);
					padding: 0;
				}

				#bcPaint{
					width: 100% !important;
					height: 100% !important;
					margin: 0 !important;
					background-color: #ffffff;
					border: 1;
				}
			}
		</style>
  </head>
  
  <body> 
   <div class="container-fluid">
    <div class="row">
     <div class="col-md-4 col-sm-4 col-xs-12"></div>
      <div class="col-md-4 col-sm-5 col-xs-12">
      
       <form class="form-container" name="signInformation" action="" method="POST">
        <h1 align="center">Signature</h1>

		<div id="bcPaint"></div>
		 <input type="hidden" id="signature" name="signature">
		 <button onclick="getSignatureBase64()" input type="submit" class="btn btn-success btn-block">Send complain application</button>
		</div>
	   </form>
      </div>
  
	  <script type="text/javascript">
	   function getSignatureBase64() {
			document.getElementById("signature").value = $.fn.bcPaint.export();
	   }
	  </script>

	  <script type="text/javascript">
			$('#bcPaint').bcPaint();
	  </script>

     </div>
   </body>
</html>
