<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '基本資料設定';

$_No = 'employee';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

$jobs_list = $CM->GET_JOBS_DATA();

$part_list = $CM->GET_PART_DATA();
?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <script>
    var no = '<?= $_No ?>';
  </script>
  <?php include('m_head.php'); ?>
  <link href="js/datepicker-tw/bootstrap-datepicker3.min.css" rel="stylesheet" />
  <script src="js/datepicker-tw/bootstrap-datepicker.js"></script>
  <script src="js/member/employee.js"></script>
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
          <div class="bg-white border rounded">
            <div class="row no-gutters">
              <div class="col-lg-8 col-xl-12">
                <div class="profile-content-right profile-right-spacing py-5">
                  <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="employee-tab" data-toggle="tab" href="#employee" role="tab" aria-controls="employee" aria-selected="true">基本資料設定</a>
                    </li>

                    <li class="nav-item">
                      <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">薪資設定</a>
                    </li>

                    <li class="nav-item">
                      <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">加班設定</a>
                    </li>

                    <li class="nav-item">
                      <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">勞健保設定</a>
                    </li>

                    <li class="nav-item">
                      <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">固定加扣款</a>
                    </li>
                  </ul>
                  <div class="tab-content px-3 px-xl-5" id="myTabContent">
                    <div class="tab-pane fade show active" id="employee" role="tabpanel" aria-labelledby="employee-tab">
                      <div class="tab-pane-content mt-5">
                        <form id="form1" onsubmit="return false;">
                          <div class="row mb-2">
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="cono">公司編號 *</label>
                                <input type="text" data-name="公司編號" class="form-control" name="cono" id="cono" value="<?= $comp['cono'] ?>" readonly required>
                              </div>
                            </div>

                            <div class="col-lg-10">
                              <div class="form-group">
                                <label for="coname1">公司名稱 *</label>
                                <input type="text" data-name="公司名稱" class="form-control" name="coname1" id="coname1" value="<?= $comp['coname1'] ?>" readonly required>
                              </div>
                            </div>

                          </div>

                          <div class="row mb-2">
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="employid">員工編號 *</label>
                                <input type="text" data-name="員工編號" maxlength="10" class="form-control" name="employid" id="employid" value="" placeholder="EX:A001" required>
                              </div>
                            </div>

                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="employname">員工姓名 *</label>
                                <input type="text" data-name="員工姓名" maxlength="10" class="form-control" name="employname" id="employname" value="" placeholder="EX:張先生" required>
                                <span class="d-block mt-1">請輸入員工全名。</span>
                              </div>
                            </div>

                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="EngName">英文姓名</label>
                                <input type="text" data-name="英文姓名" maxlength="35" class="form-control" name="EngName" id="EngName" value="" placeholder="EX:ZHANG,XIAN-SHENG" required>
                              </div>
                            </div>

                          </div>

                          <div class="row mb-2">
                            <div class="col-lg-2">
                              <div class="form-group">
                                <label for="no">卡片編號 *</label>
                                <input type="text" data-name="卡片編號" maxlength="10" class="form-control" name="no" id="no" value="" placeholder="EX:A001" required>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="id">身分證字號 *</label>
                                <input type="text" data-name="身分證字號" maxlength="10" class="form-control" name="id" id="id" value="" placeholder="EX:A12345678" required>
                              </div>
                            </div>

                            <div class="col-lg-2">
                              <div class="form-group">
                                <label class="d-inline-block" for="">性別</label>
                                <ul class="list-unstyled list-inline">
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">男
                                      <input type="radio" name="sex" checked="checked" />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>

                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">女
                                      <input type="radio" name="sex" />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label class="d-inline-block" for="">婚姻狀態</label>
                                <ul class="list-unstyled list-inline">
                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">未婚
                                      <input type="radio" name="marry" checked="checked" />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>

                                  <li class="d-inline-block mr-3">
                                    <label class="control control-radio">已婚
                                      <input type="radio" name="marry" />
                                      <div class="control-indicator"></div>
                                    </label>
                                  </li>
                                </ul>
                              </div>
                            </div>
                            <div class="col-lg-2 form-pill">
                              <div class="form-group">
                                <label for="blood">血型</label>
                                <select class="form-control" id="blood" name="blood">
                                  <option value="O">O</option>
                                  <option value="A">A</option>
                                  <option value="B">B</option>
                                  <option value="AB">AB</option>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="nationality">國籍</label>
                                <input type="text" data-name="國籍" maxlength="20" class="form-control" name="nationality" id="nationality" value="" placeholder="EX:台灣" required>
                              </div>
                            </div>
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="born">籍貫</label>
                                <input type="text" data-name="籍貫" maxlength="16" class="form-control" name="born" id="born" value="" placeholder="EX:台中市" required>
                              </div>
                            </div>


                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-3">
                              <div class="form-group">
                                <label for="bornday2">出生日期</label>
                                <div id="datebornday">
                                  <input type="text" data-name="出生日期" class="form-control" name="bornday2" id="bornday2" value="80-01-01" required>
                                </div>
                              </div>
                            </div>
                            <div class="col-lg-9">
                              <div class="form-group">
                                <label for="add">住址 *</label>
                                <input type="text" data-name="住址" maxlength="160" class="form-control" name="add" id="add" value="" placeholder="Ex: 407台中市西屯區中工二路120號" required>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-2">
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="tel">聯絡電話</label>
                                <input type="text" data-name="聯絡電話" maxlength="16" class="form-control" name="tel" id="tel" value="" placeholder="0412345678" required>
                              </div>
                            </div>
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="fax">傳真號碼</label>
                                <input type="text" data-name="傳真號碼" maxlength="16" class="form-control" name="fax" id="fax" value="" placeholder="0412345678" required>
                              </div>
                            </div>
                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="mphone">行動電話</label>
                                <input type="text" data-name="行動電話" maxlength="16" class="form-control" name="mphone" id="mphone" value="" placeholder="0912345678" required>
                              </div>
                            </div>
                          </div>
                          <div class="row mb-2">

                            <div class="col-lg-2 form-pill">
                              <div class="form-group">
                                <label for="partno">部門名稱</label>
                                <select class="form-control" data-name="部門名稱" id="partno" name="partno" required>
                                  <option value="" data-type="">選擇部門</option>
                                  <?php foreach ($part_list as $key => $value) { ?>
                                    <option value="<?= $value['partno'] ?>" data-type="<?= $value['partname'] ?>"><?= $value['partno'] ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>

                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="partname">　</label>
                                <input type="text" class="form-control" name="partname" id="partname" value="" readonly>
                              </div>
                            </div>
                            <div class="col-lg-2 form-pill">
                              <div class="form-group">
                                <label for="appno">職謂名稱</label>
                                <select class="form-control" data-name="職謂名稱" id="appno" name="appno" required>
                                  <option value="" data-type="">選擇職謂</option>
                                  <?php foreach ($jobs_list as $key => $value) { ?>
                                    <option value="<?= $value['appno'] ?>" data-type="<?= $value['appname'] ?>"><?= $value['appno'] ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>

                            <div class="col-lg-4">
                              <div class="form-group">
                                <label for="appname">　</label>
                                <input type="text" class="form-control" name="appname" id="appname" value="" readonly>
                              </div>
                            </div>
                          </div>
                          <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-primary mb-2 btn-pill memBtn" data-type="mem_edit">儲存</button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <div class="tab-pane fade" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                      <div class="tab-pane-content mt-5">
                        <form id="form2" onsubmit="return false;">
                          <div class="form-group mb-4">
                            <label for="account">帳號</label>
                            <input type="text" class="form-control" id="account" value="<?= $_MemberData['Company_Acc'] ?>" readonly>
                          </div>
                          <div class="form-group mb-4">
                            <label for="oldPassword">舊密碼 *</label>
                            <input type="password" data-name="舊密碼" name="oldPassword" class="form-control" id="oldPassword" required>
                          </div>

                          <div class="form-group mb-4">
                            <label for="newPassword">新密碼 *</label>
                            <input type="password" data-name="新密碼" name="newPassword" class="form-control" id="newPassword" required>
                          </div>

                          <div class="form-group mb-4">
                            <label for="conPassword">重新輸入新密碼 *</label>
                            <input type="password" data-name="重新輸入新密碼" name="conPassword" class="form-control" id="conPassword" required>
                            <span class="d-block mt-1 text-danger">此欄位需與新密碼完全相同。</span>
                          </div>

                          <div class="d-flex justify-content-end mt-5">
                            <button type="button" class="btn btn-primary mb-2 btn-pill pwBtn" data-type="pw_edit">儲存</button>
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