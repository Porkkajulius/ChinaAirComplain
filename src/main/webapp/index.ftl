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
     <!--  <link rel="stylesheet" href="../css/global.css"  type="text/css" > -->
    <title>Complaining form</title>
    
       <script type="text/javascript">
   var canvas, ctx, flag = false,
       prevX = 0,
       currX = 0,
       prevY = 0,
       currY = 0,
       dot_flag = false;
 
   var x = "black",
       y = 2;
 
   function init() {
       canvas = document.getElementById('can');
       ctx = canvas.getContext("2d");
       w = canvas.width;
       h = canvas.height;
 
       canvas.addEventListener("mousemove", function (e) {
           findxy('move', e)
       }, false);
       canvas.addEventListener("mousedown", function (e) {
           findxy('down', e)
       }, false);
       canvas.addEventListener("mouseup", function (e) {
           findxy('up', e)
       }, false);
       canvas.addEventListener("mouseout", function (e) {
           findxy('out', e)
       }, false);
   }
 
   function color(obj) {
       switch (obj.id) {
           case "green":
               x = "green";
               break;
           case "blue":
               x = "blue";
               break;
           case "red":
               x = "red";
               break;
           case "yellow":
               x = "yellow";
               break;
           case "orange":
               x = "orange";
               break;
           case "black":
               x = "black";
               break;
           case "white":
               x = "white";
               break;
       }
       if (x == "white") y = 14;
       else y = 2;
 
   }
 
   function draw() {
       ctx.beginPath();
       ctx.moveTo(prevX, prevY);
       ctx.lineTo(currX, currY);
       ctx.strokeStyle = x;
       ctx.lineWidth = y;
       ctx.stroke();
       ctx.closePath();
   }
 
   function erase() {
       var m = confirm("Want to clear");
       if (m) {
           ctx.clearRect(0, 0, w, h);
           document.getElementById("canvasimg").style.display = "none";
       }
   }
 
   function save() {
       document.getElementById("canvasimg").style.border = "2px solid";
       var dataURL = canvas.toDataURL();
       document.getElementById("canvasimg").src = dataURL;
       document.getElementById("canvasimg").style.display = "inline";
   }
 
   function findxy(res, e) {
       if (res == 'down') {
           prevX = currX;
           prevY = currY;
           currX = e.clientX - canvas.offsetLeft;
           currY = e.clientY - canvas.offsetTop;
 
           flag = true;
           dot_flag = true;
           if (dot_flag) {
               ctx.beginPath();
               ctx.fillStyle = x;
               ctx.fillRect(currX, currY, 2, 2);
               ctx.closePath();
               dot_flag = false;
           }
       }
       if (res == 'up' || res == "out") {
           flag = false;
       }
       if (res == 'move') {
           if (flag) {
               prevX = currX;
               prevY = currY;
               currX = e.clientX - canvas.offsetLeft;
               currY = e.clientY - canvas.offsetTop;
               draw();
           }
       }
   }
   </script>
  </head>
<body onload="init()">

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
              <canvas id="can" width="600" height="100" style="border:2px solid;"></canvas>
       <input class="form-control" name="signature" type="button" value="clear" id="clr" size="23" onclick="erase()">
    
  </div>


	<button input type="submit" class="btn btn-success btn-block">Send complain application</button>
	
</form>

  </div>
  
</div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>