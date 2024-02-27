<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '員工班別設定';

$_No = 'attendance';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

$bank = $CM->GET_ATTENDANCE_DATA();

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
                    <h2>員工班別設定</h2>
                  </div>
                  <div class="card-body">
                    <form id="form1" onsubmit="return false;">
                      <div class="row mb-2">
                        <div class="col-lg-6">
                          <div class="form-group">
                            <label for="partno">班別編號 *</label>
                            <input type="text" data-name="班別編號" class="form-control" name="partno" id="partno" value="" placeholder="Ex:B" required>
                          </div>
                        </div>
                      </div>
                      <div class="form-group mb-4">
                        <label for="partname">班別名稱 *</label>
                        <input type="text" data-name="班別名稱" class="form-control" name="partname" id="partname" value="" placeholder="Ex:B" required>
                      </div>
                      <div class="table-scroll">
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th scope="col">星期</th>
                              <th scope="col">上班時間</th>
                              <th scope="col">遲到時間</th>
                              <th scope="col">休息時間1</th>
                              <th scope="col"></th>
                              <th scope="col">休息時間2</th>
                              <th scope="col"></th>
                              <th scope="col">下班時間</th>
                              <th scope="col">加班上班時間</th>
                              <th scope="col">加班下班時間</th>
                              <th scope="col">誤餐時間</th>
                              <th scope="col">出勤分鐘</th>
                              <th scope="col">出勤日</th>
                            </tr>
                          </thead>
                          <tbody class="datalist">
                            <?php foreach ($week_states as $key => $value) { ?>
                              <tr>
                                <td><?= $value ?><input class="form-control" name="week[]" type="hidden" value="<?= $value ?>"></td>
                                <td><input class="form-control" name="ontime[]" type="time" value=""></td>
                                <td><input class="form-control" name="latetime[]" type="time" value=""></td>
                                <td><input class="form-control" name="resttime1[]" type="time" value=""></td>
                                <td><input class="form-control" name="resttime2[]" type="time" value=""></td>
                                <td><input class="form-control" name="resttime3[]" type="time" value=""></td>
                                <td><input class="form-control" name="resttime4[]" type="time" value=""></td>
                                <td><input class="form-control" name="offtime[]" type="time" value=""></td>
                                <td><input class="form-control" name="addontime[]" type="time" value=""></td>
                                <td><input class="form-control" name="addofftime[]" type="time" value=""></td>
                                <td><input class="form-control" name="mealtime[]" type="time" value=""></td>
                                <td><input class="form-control" name="worktime[]" type="time" value=""></td>
                                <td>
                                  <select name="type[]">
                                    <option value="工作日">工作日</option>
                                    <option value="休息日">休息日</option>
                                    <option value="例假日">例假日</option>
                                    <option value="國定日">國定日</option>
                                    <option value="空班日">空班日</option>
                                  </select>
                                </td>
                              </tr>
                            <?php } ?>
                          </tbody>
                        </table>
                      </div>
                    </form>
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