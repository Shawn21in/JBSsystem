<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '職位編號設定';

$_No = 3;           //按鈕列的序號，第一個有連結的按鈕為0，第二個為1，以次類推.....

$comp = GET_COMP_DATA();

$jobs = $CM->GET_JOBS_DATA();

?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <script>
    var no = <?= $_No ?>;
  </script>
  <?php include('m_head.php'); ?>
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
    <?php require('m_aside.php'); ?>
    <!-- ====================================
        ——— PAGE WRAPPER
        ===================================== -->
    <div class="page-wrapper">
      <!-- Header -->
      <?php require('m_header.php'); ?>
      <!-- ====================================
          ——— CONTENT WRAPPER
          ===================================== -->
      <div class="content-wrapper">
        <div class="content">
          <div class="card card-default">
            <div class="card-header card-header-border-bottom">
              <h2>職位編號設定</h2>
            </div>

            <div class="card-body">
              <form id="form1" onsubmit="return false;">
                <div class="row mb-2">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <label for="appno">職位編號 *</label>
                      <input type="text" data-name="職位編號" class="form-control" name="appno" id="appno" value="<?= $jobs['appno'] ?>" placeholder="Ex:BE" required>
                    </div>
                  </div>
                </div>

                <div class="form-group mb-4">
                  <label for="appname">職位名稱 *</label>
                  <input type="text" data-name="職位名稱" class="form-control" name="appname" id="appname" value="<?= $jobs['appname'] ?>" placeholder="Ex:後端工程師" required>
                  <span class="d-block mt-1">請輸入職位名稱全名。</span>
                </div>
                <div class="d-flex justify-content-end mt-5">
                  <button type="button" class="btn btn-primary mb-2 btn-pill saveBtn" data-type="jobs_edit">儲存</button>
                </div>
              </form>
            </div>
          </div>
        </div><!-- End Content -->
      </div><!-- End Content Wrapper -->
      <!-- Footer -->
      <?php require('m_footer.php'); ?>
    </div><!-- End Page Wrapper -->
  </div><!-- End Wrapper -->
  <!-- <script type="module">
      import 'https://cdn.jsdelivr.net/npm/@pwabuilder/pwaupdate';
      const el = document.createElement('pwa-update');
      document.body.appendChild(el);
    </script> -->

</body>

</html>