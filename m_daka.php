<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '打卡資料匯入';

$_No = 'daka';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

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
                        <form id="form3" onsubmit="return false;">
                          <div class="em_title mb-2">
                            <h2>打卡資料設定</h2>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label class="d-inline-block" for="">年份格式</label>
                                <ul class="list-unstyled list-inline">
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">西元
                                      <input type="radio" name="yeartype" value="1" <?= $employee['yeartype'] == '1'  ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">民國
                                      <input type="radio" name="yeartype" value="2" <?= $employee['yeartype'] == '2' ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label class="d-inline-block" for="">號碼判斷</label>
                                <ul class="list-unstyled list-inline">
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">編號
                                      <input type="radio" name="yeartype" value="1" <?= $employee['yeartype'] == '1'  ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">卡號
                                      <input type="radio" name="yeartype" value="2" <?= $employee['yeartype'] == '2' ? 'checked' : '' ?> />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>日期(年)：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="years"></label>
                                <input type="number" data-name="日期(年)起" class="form-control" name="years" id="years" value="<?= $employee['years'] ? $employee['years'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="yeare"></label>
                                <input type="number" data-name="日期(年)末" class="form-control" name="yeare" id="yeare" value="<?= $employee['yeare'] ? $employee['yeare'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="yearsum"></label>
                                <input type="number" class="form-control" name="yearsum" id="yearsum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>(月)：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="months"></label>
                                <input type="number" data-name="日期(月)起" class="form-control" name="months" id="months" value="<?= $employee['months'] ? $employee['months'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="monthe"></label>
                                <input type="number" data-name="日期(月)末" class="form-control" name="monthe" id="monthe" value="<?= $employee['monthe'] ? $employee['monthe'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="monthsum"></label>
                                <input type="number" class="form-control" name="monthsum" id="monthsum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>(日)：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="days"></label>
                                <input type="number" data-name="日期(日)起" class="form-control" name="days" id="days" value="<?= $employee['days'] ? $employee['days'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="daye"></label>
                                <input type="number" data-name="日期(日)末" class="form-control" name="daye" id="daye" value="<?= $employee['daye'] ? $employee['daye'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="daysum"></label>
                                <input type="number" class="form-control" name="daysum" id="daysum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>時間(時)：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="hours"></label>
                                <input type="number" data-name="時間(時)起" class="form-control" name="hours" id="hours" value="<?= $employee['hours'] ? $employee['hours'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="houre"></label>
                                <input type="number" data-name="時間(時)末" class="form-control" name="houre" id="houre" value="<?= $employee['houre'] ? $employee['houre'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="hoursum"></label>
                                <input type="number" class="form-control" name="hoursum" id="hoursum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>(分)：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="minutes"></label>
                                <input type="number" data-name="時間(分)起" class="form-control" name="minutes" id="minutes" value="<?= $employee['minutes'] ? $employee['minutes'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="minutee"></label>
                                <input type="number" data-name="時間(分)末" class="form-control" name="minutee" id="minutee" value="<?= $employee['minutee'] ? $employee['minutee'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="minutesum"></label>
                                <input type="number" class="form-control" name="minutesum" id="minutesum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>員工編(卡)號：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="employees"></label>
                                <input type="number" data-name="員工編(卡)號起" class="form-control" name="employees" id="employees" value="<?= $employee['employees'] ? $employee['employees'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="employeee"></label>
                                <input type="number" data-name="員工編(卡)號末" class="form-control" name="employeee" id="employeee" value="<?= $employee['employeee'] ? $employee['employeee'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="employeesum"></label>
                                <input type="number" class="form-control" name="employeesum" id="employeesum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-2 form-inline font-weight-bold justify-content-end"><label>識別代碼：第</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="discerns"></label>
                                <input type="number" data-name="識別代碼：第起" class="form-control" name="discerns" id="discerns" value="<?= $employee['discerns'] ? $employee['discerns'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位至</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="discerne"></label>
                                <input type="number" data-name="識別代碼：第末" class="form-control" name="discerne" id="discerne" value="<?= $employee['discerne'] ? $employee['discerne'] : '0' ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>位，共</label></div>
                            <div class="col-lg-1">
                              <div class="form-group">
                                <label for="discernsum"></label>
                                <input type="number" class="form-control" name="discernsum" id="discernsum" readonly>
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold"><label>碼</label></div>
                          </div>
                          <div class="em_title mb-2">
                            <h2>識別代碼</h2>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>早上</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="ontimed"></label>
                                <input type="text" data-name="早上" class="form-control" name="ontimed" id="ontimed" value="<?= $cardset['ontimed'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>早下</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="restime1d"></label>
                                <input type="text" data-name="早下" class="form-control" name="restime1d" id="restime1d" value="<?= $cardset['restime1d'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>下上</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="restime2d"></label>
                                <input type="text" data-name="下上" class="form-control" name="restime2d" id="restime2d" value="<?= $cardset['ontimed'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>下下</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="offtimed"></label>
                                <input type="text" data-name="下下" class="form-control" name="offtimed" id="offtimed" value="<?= $cardset['restime1d'] ?>">
                              </div>
                            </div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>加上</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="addontimed"></label>
                                <input type="text" data-name="加上" class="form-control" name="addontimed" id="addontimed" value="<?= $cardset['addontimed'] ?>">
                              </div>
                            </div>
                            <div class="col-lg-1 form-inline font-weight-bold justify-content-end"><label>加下</label></div>
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="addofftimed"></label>
                                <input type="text" data-name="加下" class="form-control" name="addofftimed" id="addofftimed" value="<?= $cardset['addofftimed'] ?>">
                              </div>
                            </div>
                          </div>
                          <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-primary mb-2 btn-pill saveBtn" data-no="3" data-type="overtime_edit" <?= $employid ? '' : 'disabled' ?>>儲存</button>
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