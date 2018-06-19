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
			*{
			  margin: 0;
			  padding: 0;
			  list-style: none;
			}

			body{
			  font-family: "proxima-nova-soft", "Proxima Nova Soft", Helvetica, Arial, sans-serif;
			  background-color: #f9f9f9;
			}

			#container{
			  width: 100%;
			  height: 100%;
			  max-width: 960px;
			  margin: auto;
			  background-color: #ffffff;
			  position: relative;
			}

			#container h5{
			  font-size: 12px;
			  font-weight: 400;
			  text-transform: uppercase;
			  margin-top: 40px;
			  margin-bottom: 10px;
			}

			#container h4{
			  font-size: 12px;
			  font-weight: 300;
			}

			#container h3{
			  font-size: 16px;
			  font-weight: 400;
			  margin: 10px 0;
			}

			#container > #header{
			  background-color: #313131;
			  color: #e8e8e8;
			  text-align: center;
			  width: 100%;
			  padding: 45px 0;
			}

			#container > #middle{
			  height: 310px;
			  padding: 40px;
			}

			#container > #middle > #features{
			  float: left;
			  margin-top: -20px;
			}

			#container > #middle > #features > ul > li{
			  font-size: 12px;
			  font-weight: 300;
			  margin-bottom: 7px;
			  margin-left: 5px;
			}

			#container > #middle > #features > .code{
			  font-size: 10px;
			  font-weight: 300;
			  color: #5a5a5a;
			  border: 1px dashed #ddd;
			  padding: 7px 30px 7px 10px;
			}

			#container > #middle > #features > a{
			  color: #000;
			  font-size: 10px;
			}

			#container > #middle > #bcPaint{
			  width: 600px;
			  height: 400px;
			  float: right;
			}

			@media (max-width: 1024px){
				body{
					top: 0;
					right: 0;
					bottom: 0;
					left: 0;
					position: fixed;
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
				}
			}
		</style>
  </head>
<body>

<div class="container-fluid">
<div class="row">


  <div class="col-md-4 col-sm-4 col-xs-12"></div>
   <div class="col-md-4 col-sm-5 col-xs-12">
  <form class="form-container" name="applicantInformation" action="" method="POST">
  <h1>Information for complaint form</h1>
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input class="form-control" name="name" placeholder="Xin Lin">
  </div>

   <div class="form-group">
    <label for="exampleInputEmail1">Personal identification number</label>
    <input class="form-control" name="id" placeholder="000000-XXX0">
  </div>

   <div class="form-group">
    <label for="exampleInputEmail1">Aircraft company name</label>
    <input class="form-control" name="aircraftName" placeholder="XXX aircraft">
  </div>

    <div class="form-group">
    <label for="exampleInputEmail1"></label>
			<div id="container">
				<div id="bcPaint"></div>
			</div>
			<input type="hidden" id="signature" name="signature">
		</div>
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
</div>

     </body>
</html>
