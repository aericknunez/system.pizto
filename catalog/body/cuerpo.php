
<div class="container-fluid">

	<div class="row">

			<div id="container" class="col-xs-8 col-sm-12 col-md-8">
		<?php 
		include_once 'application/src/redirect.php';
		?>
			</div>

			<div id="lateral" class="col-xs-4 col-sm-12 col-md-4 mt-4">
		<?php 
			if(isset($_GET["admon"])) {
				include_once 'system/admon/lateral.php';
			} else {
				include_once 'system/ventas/lateral.php';	
			}	
		 ?>
			</div>

	</div>


</div>
