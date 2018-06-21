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
    <label for="exampleInputEmail1">Aircraft company name</label>
    <input class="form-control" name="aircraftName" placeholder="XXX aircraft">
  </div>
     <div class="form-group">
    <label for="exampleInputEmail1">Aircraft company name</label>
    <input class="form-control" name="aircraftName" placeholder="XXX aircraft">
  </div>
     <div class="form-group">
    <label for="exampleInputEmail1">Aircraft company name</label>
    <input class="form-control" name="aircraftName" placeholder="XXX aircraft">
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
