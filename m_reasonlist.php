<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '健保退保列表';

$_No = 'reason';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

$reason = $CM->GET_REASON_DATA();

?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <script>
    var no = '<?= $_No ?>';
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
          <div class="row">
            <div class="col-12">
              <div class="col-lg-12">
                <div class="card card-default">
                  <div class="card-header card-header-border-bottom">
                    <h2>部門編號列表</h2>
                    <button type="button" class="mb-1 btn btn-outline-primary" onclick="location.href='m_reason.php'">
                      <i class=" mdi mdi-plus mr-1"></i> 新增</button>
                  </div>

                  <div class="card-body">
                    <!-- <p class="mb-5"></p> -->

                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th scope="col">編號</th>
                          <th scope="col">部門名稱</th>
                          <th scope="col">選項</th>
                        </tr>
                      </thead>

                      <tbody>
                        <?php foreach ($reason as $key => $value) { ?>
                          <tr>
                            <td><?= $value['reasonno'] ?></td>
                            <td><?= $value['reason'] ?></td>
                            <td>
                              <form onsubmit="return false;">
                                <a href="m_reason.php?c=<?php echo OEncrypt('v=' . $value['reasonno'], 'reason'); ?>"><span class="mdi mdi-pencil"></span></a>
                                <input type="hidden" name="reasonno" value="<?= rawurldecode(OEncrypt('v=' . $value['reasonno'], 'reason')) ?>">
                                <a href="javascript:void(0)" class="delBtn" data-type="reason_del"><span class="mdi mdi-delete"></span></a>
                              </form>
                            </td>
                          </tr>
                        <?php } ?>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
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