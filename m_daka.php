<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '打卡資料匯入';

$_No = 'daka';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

$Input   = GDC($_GET['c'], 'employee');

$employid = $Input['v'];

?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <script>
    var no = '<?= $_No ?>';
  </script>
  <?php include('m_head.php'); ?>
  <script src="https://cdn.jsdelivr.net/npm/bs-custom-file-input/dist/bs-custom-file-input.min.js" crossorigin="anonymous"></script>
  <link href="js/datepicker-tw/bootstrap-datepicker3.min.css" rel="stylesheet" />
  <script src="js/datepicker-tw/bootstrap-datepicker.js"></script>
  <script src="js/member/employee.js"></script>

</head>

<body class="header-fixed sidebar-fixed sidebar-dark header-light" id="body">
  <script>
    $(document).ready(function() {
      bsCustomFileInput.init()
    })

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
          <div class="bg-white border rounded">
            <div class="row no-gutters">
              <div class="col-xl-12">
                <div class="profile-content-right profile-right-spacing py-5">
                  <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="import-tab" data-toggle="tab" href="#import" role="tab" aria-controls="import" aria-selected="true">打卡資料匯入</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="cardset-tab" data-toggle="tab" href="#cardset" role="tab" aria-controls="cardset" aria-selected="false">txt設定</a>
                    </li>
                  </ul>
                  <div class="tab-content px-3 px-xl-5" id="myTabContent">
                    <div class="tab-pane fade show active" id="import" role="tabpanel" aria-labelledby="import-tab">
                      <div class="tab-pane-content mt-5">
                        <form id="form1" onsubmit="return false;">
                          <div class="row mb-2">
                            <div class="col-lg-12">
                              <div class="form-group">
                                <div class="custom-file">
                                  <label class="custom-file-label" for="customFile">選擇要上傳的打卡資料</label>
                                  <input type="file" class="custom-file-input" id="customFile">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-primary mb-2 btn-pill saveBtn" data-type="">送出</button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <div class="tab-pane fade" id="cardset" role="tabpanel" aria-labelledby="cardset-tab">
                      <div class="tab-pane-content mt-5">
                        <form id="form2" onsubmit="return false;">
                          <input type="hidden" name="eid" value="<?= $employee['eid'] ?>">
                          <div class="em_title mb-2">
                            <h2>薪資設定</h2>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-6">
                              <div class="form-group">
                                <label class="d-inline-block" for="">薪資方式</label>
                                <ul class="list-unstyled list-inline">
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">月薪
                                      <input type="radio" name="sandtype" value="1" <?= $employee['sandtype'] == '1' || $employee['sandtype'] == '' ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">日薪
                                      <input type="radio" name="sandtype" value="2" <?= $employee['sandtype'] == '2' ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">時薪
                                      <input type="radio" name="sandtype" value="3" <?= $employee['sandtype'] == '3' ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="standardday">基準天數</label>
                                <input type="number" data-name="基準天數" class="form-control" step="0.0001" name="standardday" id="standardday" placeholder="ex:30" value="<?= $employee['standardday'] ? $employee['standardday'] : '30' ?>" required>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="standardhour">基準時數</label>
                                <input type="number" data-name="基準時數" class="form-control" step="0.1" name="standardhour" id="standardhour" placeholder="ex:8" value="<?= $employee['standardhour'] ? $employee['standardhour'] : '8' ?>" required>
                              </div>
                            </div>
                          </div>

                          <div class="row mb-2">
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="monthmny">月薪金額</label>
                                <input type="number" data-name="月薪金額" class="form-control" step="0.0001" name="monthmny" id="monthmny" value="<?= $employee['monthmny'] ? $employee['monthmny'] : 0 ?>" <?= $employee['sandtype'] == '2' || $employee['sandtype'] == '3' ? 'readonly' : '' ?>>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="daymny">換算日薪</label>
                                <input type="number" data-name="換算日薪" class="form-control" step="0.0001" name="daymny" id="daymny" value="<?= $employee['daymny'] ? $employee['daymny'] : 0 ?>" <?= $employee['sandtype'] == '3' ? 'readonly' : '' ?>>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="hourmny">換算時薪</label>
                                <input type="number" data-name="換算時薪" class="form-control" step="0.0001" name="hourmny" id="hourmny" value="<?= $employee['hourmny'] ? $employee['hourmny'] : 0 ?>">
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="taxmny">扣繳稅額</label>
                                <input type="number" data-name="扣繳稅額" class="form-control" step="0.0001" name="taxmny" id="taxmny" value="<?= $employee['taxmny'] ? $employee['taxmny'] : 0 ?>">
                              </div>
                            </div>
                          </div>
                          <div class="row mb-6">
                            <div class="col-lg-2">
                              <label>上班打卡</label>
                              <label class="switch switch-primary switch-pill form-control-label">
                                <input type="checkbox" class="switch-input form-check-input" name="starttype" value="1" <?= $employee['starttype'] == '1' ? 'checked' : '' ?>>
                                <span class="switch-label"></span>
                                <span class="switch-handle"></span>
                              </label>
                            </div>
                            <div class="col-lg-2">
                              <label>休息打卡</label>
                              <label class="switch switch-primary switch-pill form-control-label">
                                <input type="checkbox" class="switch-input form-check-input" name="resttype" value="1" <?= $employee['resttype'] == '1' ? 'checked' : '' ?>>
                                <span class="switch-label"></span>
                                <span class="switch-handle"></span>
                              </label>
                            </div>
                          </div>
                          <div class="em_title mb-2">
                            <h2>銀行帳號1</h2>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-pill">
                              <div class="form-group">
                                <label for="bankno">銀行名稱</label>
                                <select class="form-control" data-name="銀行名稱" id="bankno" name="bankno">
                                  <option value="" data-type="">選擇銀行</option>
                                  <?php foreach ($bank_list as $key => $value) { ?>
                                    <option value="<?= $value['bankno'] ?>" data-type="<?= $value['bankname'] ?>" <?= $employee['bankno'] == $value['bankno'] ? 'selected' : '' ?>><?= $value['bankno'] ?> <?= $value['bankname'] ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="bankname">　</label>
                                <input type="text" class="form-control" name="bankname" id="bankname" value="<?= $employee['bankname'] ?>" readonly>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="huming">戶名</label>
                                <input type="text" data-name="戶名" maxlength="15" class="form-control" name="huming" id="huming" value="<?= $employee['huming'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="bankid">銀行帳號</label>
                                <input type="text" data-name="銀行帳號" maxlength="30" class="form-control" name="bankid" id="bankid" value="<?= $employee['bankid'] ?>">
                              </div>
                            </div>
                          </div>
                          <div class="em_title mb-2">
                            <h2>銀行帳號2</h2>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-pill">
                              <div class="form-group">
                                <label for="bankno2">銀行名稱</label>
                                <select class="form-control" data-name="銀行名稱" id="bankno2" name="bankno2">
                                  <option value="" data-type="">選擇銀行</option>
                                  <?php foreach ($bank_list as $key => $value) { ?>
                                    <option value="<?= $value['bankno'] ?>" data-type="<?= $value['bankname'] ?>" <?= $employee['bankno2'] == $value['bankno'] ? 'selected' : '' ?>><?= $value['bankno'] ?> <?= $value['bankname'] ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="bankname2">　</label>
                                <input type="text" class="form-control" name="bankname2" id="bankname2" value="<?= $employee['bankname2'] ?>" readonly>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="huming2">戶名</label>
                                <input type="text" data-name="戶名" maxlength="15" class="form-control" name="huming2" id="huming2" value="<?= $employee['huming2'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="bankid2">銀行帳號</label>
                                <input type="text" data-name="銀行帳號" maxlength="30" class="form-control" name="bankid2" id="bankid2" value="<?= $employee['bankid2'] ?>">
                              </div>
                            </div>
                          </div>
                          <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-primary mb-2 btn-pill saveBtn" data-no="2" data-type="salary_edit" <?= $employid ? '' : 'disabled' ?>>儲存</button>
                          </div>
                        </form>
                      </div>
                    </div>
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