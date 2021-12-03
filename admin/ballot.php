<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">


  <?php include 'includes/menubar.php'; ?>
  <?php include 'includes/slugify.php'; ?>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Report
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Report Preview</li>
      </ol>
    </section>
         <div class="row">
        <div class="col-xs-12">
          <h3>Votes Tally
            <span class="pull-right">
              <a href="print.php" class="btn btn-success btn-sm btn-flat"><span class="glyphicon glyphicon-print"></span> Print</a>
            </span>
          </h3>
        </div>
      </div>

      <?php
        $sql = "SELECT * FROM positions ORDER BY priority ASC";
        $query = $conn->query($sql);
        $inc = 2;
        while($row = $query->fetch_assoc()){
          $inc = ($inc == 2) ? 1 : $inc+1; 
          if($inc == 1) echo "<div class='row'>";
          echo "
            <div class='col-sm-6'>
              <div class='box box-solid'>
                <div class='box-header with-border'>
                  <h4 class='box-title'><b>".$row['description']."</b></h4>
                </div>
                <div class='box-body'>
                  <div class='chart'>
                    <canvas id='".slugify($row['description'])."' style='height:200px'></canvas>
                  </div>
                </div>
              </div>
            </div>
          ";
          if($inc == 2) echo "</div>";  
        }
        if($inc == 1) echo "<div class='col-sm-6'></div></div>";
      ?>

      </section>
      <!-- right col -->
    </div>
  	

</div>
<!-- ./wrapper -->

<?php include 'includes/scripts.php'; ?>
<?php
  $sql = "SELECT * FROM positions ORDER BY priority ASC";
  $query = $conn->query($sql);
  while($row = $query->fetch_assoc()){
    $sql = "SELECT * FROM candidates WHERE position_id = '".$row['id']."'";
    $cquery = $conn->query($sql);
    $carray = array();
    $varray = array();
    while($crow = $cquery->fetch_assoc()){
      array_push($carray, $crow['lastname']);
      $sql = "SELECT * FROM votes WHERE candidate_id = '".$crow['id']."'";
      $vquery = $conn->query($sql);
      array_push($varray, $vquery->num_rows);
    }
    $carray = json_encode($carray);
    $varray = json_encode($varray);
    ?>
    <script>
    $(function(){
      var rowid = '<?php echo $row['id']; ?>';
      var description = '<?php echo slugify($row['description']); ?>';
      var barChartCanvas = $('#'+description).get(0).getContext('2d')
      var barChart = new Chart(barChartCanvas)
      var barChartData = {
        labels  : <?php echo $carray; ?>,
        datasets: [
          {
            label               : 'Votes',
            fillColor           : 'rgba(60,141,188,0.9)',
            strokeColor         : 'rgba(60,141,188,0.8)',
            pointColor          : '#3b8bba',
            pointStrokeColor    : 'rgba(60,141,188,1)',
            pointHighlightFill  : '#fff',
            pointHighlightStroke: 'rgba(60,141,188,1)',
            data                : <?php echo $varray; ?>
          }
        ]
      }
      var barChartOptions                  = {
        //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
        scaleBeginAtZero        : true,
        //Boolean - Whether grid lines are shown across the chart
        scaleShowGridLines      : true,
        //String - Colour of the grid lines
        scaleGridLineColor      : 'rgba(0,0,0,.05)',
        //Number - Width of the grid lines
        scaleGridLineWidth      : 1,
        //Boolean - Whether to show horizontal lines (except X axis)
        scaleShowHorizontalLines: true,
        //Boolean - Whether to show vertical lines (except Y axis)
        scaleShowVerticalLines  : true,
        //Boolean - If there is a stroke on each bar
        barShowStroke           : true,
        //Number - Pixel width of the bar stroke
        barStrokeWidth          : 2,
        //Number - Spacing between each of the X value sets
        barValueSpacing         : 5,
        //Number - Spacing between data sets within X values
        barDatasetSpacing       : 1,
        //String - A legend template
        legendTemplate          : '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>',
        //Boolean - whether to make the chart responsive
        responsive              : true,
        maintainAspectRatio     : true
      }

      barChartOptions.datasetFill = false
      var myChart = barChart.HorizontalBar(barChartData, barChartOptions)
      //document.getElementById('legend_'+rowid).innerHTML = myChart.generateLegend();
    });
    </script>
    <?php
  }
?>

  </div>  
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
  fetch();

  $(document).on('click', '.reset', function(e){
    e.preventDefault();
    var desc = $(this).data('desc');
    $('.'+desc).iCheck('uncheck');
  });

  $(document).on('click', '.moveup', function(e){
    e.preventDefault();
    var id = $(this).data('id');
    $('#'+id).animate({
      'marginTop' : "-300px"
    });
    $.ajax({
      type: 'POST',
      url: 'ballot_up.php',
      data:{id:id},
      dataType: 'json',
      success: function(response){
        if(!response.error){
          fetch();
        }
      }
    });
  });

  $(document).on('click', '.movedown', function(e){
    e.preventDefault();
    var id = $(this).data('id');
    $('#'+id).animate({
      'marginTop' : "+300px"
    });
    $.ajax({
      type: 'POST',
      url: 'ballot_down.php',
      data:{id:id},
      dataType: 'json',
      success: function(response){
        if(!response.error){
          fetch();
        }
      }
    });
  });

});

function fetch(){
  $.ajax({
    type: 'POST',
    url: 'ballot_fetch.php',
    dataType: 'json',
    success: function(response){
      $('#content').html(response).iCheck({checkboxClass: 'icheckbox_flat-green',radioClass: 'iradio_flat-green'});
    }
  });
}
</script>
</body>
</html>
