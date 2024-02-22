<?php
require_once("include/web.config.php");
//不接受任何get資料
if (!empty($_GET)) {
  header("Location: login.php");
  exit;
}
if (!$_Login) {
  header("Location:index.php");
  exit;
}
$_Title = '會員中心';
?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <?php include('head_m.php'); ?>
  <title></title>
</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light" id="body">
  <script>
    NProgress.configure({
      showSpinner: false
    });
    NProgress.start();
  </script>
  <!-- <div id="toaster"></div> -->
  <!-- ====================================
    ——— WRAPPER
    ===================================== -->
  <div class="wrapper">
    <!-- ====================================
          ——— LEFT SIDEBAR WITH OUT FOOTER
        ===================================== -->
    <?php require('aside.php'); ?>
    <!-- ====================================
        ——— PAGE WRAPPER
        ===================================== -->
    <div class="page-wrapper">
      <!-- Header -->
      <?php require('header_m.php'); ?>
      <!-- ====================================
          ——— CONTENT WRAPPER
          ===================================== -->
      <div class="content-wrapper">
        <div class="content">
          <div class="row">
            <div class="col-12">
              <!-- Recent Order Table -->
              <div class="card card-table-border-none recent-orders" id="recent-orders">
                <div class="card-header justify-content-between">
                  <h2>歡迎您使用 JBS 雲端出勤任意打卡系統！</h2>
                </div>
              </div>
            </div>
          </div>
        </div><!-- End Content -->
      </div><!-- End Content Wrapper -->
      <!-- Footer -->
      <?php require('footer_m.php'); ?>
    </div><!-- End Page Wrapper -->
  </div><!-- End Wrapper -->
  <!-- <script type="module">
      import 'https://cdn.jsdelivr.net/npm/@pwabuilder/pwaupdate';
      const el = document.createElement('pwa-update');
      document.body.appendChild(el);
    </script> -->
  <!-- Javascript -->
  <script src="stylesheets/assets/plugins/jquery/jquery.min.js"></script>
  <script src="stylesheets/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="stylesheets/assets/plugins/simplebar/simplebar.min.js"></script>
  <script src='stylesheets/assets/plugins/charts/Chart.min.js'></script>
  <script src='stylesheets/assets/js/chart.js'></script>
  <script src='stylesheets/assets/plugins/jvectormap/jquery-jvectormap-2.0.3.min.js'></script>
  <script src='stylesheets/assets/plugins/jvectormap/jquery-jvectormap-world-mill.js'></script>
  <script src='stylesheets/assets/js/vector-map.js'></script>
  <script src='stylesheets/assets/plugins/daterangepicker/moment.min.js'></script>
  <script src='stylesheets/assets/plugins/daterangepicker/daterangepicker.js'></script>
  <script src='stylesheets/assets/js/date-range.js'></script>
  <script src='stylesheets/assets/plugins/toastr/toastr.min.js'></script>
  <script src="stylesheets/assets/js/sleek.js"></script>
  <link href="stylesheets/assets/options/optionswitch.css" rel="stylesheet">
  <script src="stylesheets/assets/options/optionswitcher.js"></script>
</body>

</html>