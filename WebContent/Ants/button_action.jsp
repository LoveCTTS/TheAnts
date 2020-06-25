<!DOCTYPE html>
<html>
<body>


<div id="demo">
<h2>The XMLHttpRequest Object</h2>

</div>

<script>
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "oasis.jpg", true);
  xhttp.send();
}
</script>

<button type="button" onclick="loadDoc()">Change Content</button>
</body>
</html>
