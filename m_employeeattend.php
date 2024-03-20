<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '員工出勤作業設定';

$_No = 'employeeattend';           //按鈕列名稱，對應m_aside.php的<li data-no=" $_No ">

$comp = GET_COMP_DATA();

$employee_list = $CM->get_employee_list();

$Input   = GDC($_GET['c'], 'deduction');

$deductionno = $Input['v'];

if (empty($deductionno)) { //判斷是否為編輯模式
  $edit = 0;
} else {
  $deduction = $CM->GET_DEDUCTION_DATA($deductionno);
  $deduction = $deduction[0];
  $edit = 1;
}

?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <script>
    var no = '<?= $_No ?>';
  </script>
  <?php include('m_head.php'); ?>
  <!-- <link rel="stylesheet" href="js/plugin/chosen/docsupport/style.css"> -->
  <link rel="stylesheet" href="js/plugin/chosen/docsupport/prism.css">
  <link rel="stylesheet" href="js/plugin/chosen/bootstrap4c-chosen.css">
  <script src="js/plugin/chosen/chosen.jquery.js" type="text/javascript"></script>
  <script src="js/plugin/chosen/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
  <script src="js/plugin/chosen/docsupport/init.js" type="text/javascript" charset="utf-8"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script src="js/member/employeeattend.js" type="text/javascript" charset="utf-8"></script>
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
          <div id="accordion3" class="accordion accordion-bordered ">
            <!-- 人員選擇 -->
            <div class="card card-default">
              <div class="card-header" id="heading1">
                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
                  員工出勤作業
                </button>
              </div>

              <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion3">
                <div class="card-body">
                  <form id="form1" onsubmit="return false;">
                    <input type="hidden" class="form-control" name="deductionid" value="<?= $deduction['deductionno'] ?>">
                    <div class="row mb-2">
                      <div class="col-lg-6">
                        <div class="form-group">
                          <label for="deductionno">年度 *</label>
                          <input type="number" data-name="年度" class="form-control" name="deductionno" id="deductionno" value="" placeholder="Ex:113" required>
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-4">
                      <label for="deductionname">選擇員工 *</label>
                      <div>
                        <select data-placeholder="查看編號及姓名" id="employ" class="form-control">
                          <option value=""></option>
                          <?php foreach ($employee_list as $key => $value) { ?>
                            <option value="<?= $value['eid'] ?>"><?= $value['employid'] ?> <?= $value['employname'] ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                    <div class="d-flex justify-content-end mt-5">
                      <button type="button" class="btn btn-primary mb-2 btn-pill saveBtn" data-type="deduction_edit">
                        查看
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!-- 出勤曆 -->
            <div class="card card-default">
              <div class="card-header" id="heading2">
                <button class="btn btn-link" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                  員工出勤曆
                </button>
              </div>

              <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion3">
                <div class="card-body">
                  <form id="form2" onsubmit="return false;">
                    <input type="hidden" class="form-control" name="deductionid" value="<?= $deduction['deductionno'] ?>">
                    <div class="row mb-2">
                      <div class="col-lg-12">
                        <div class="form-group">
                          <label for="deductionno">年度 *</label>
                          <input type="number" class="form-control" name="deductionno" id="deductionno" value="" placeholder="Ex:113" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="row mb-2">
                      <div class="col-lg-12">
                        <div class="form-group">
                          <label for="deductionno">員工 *</label>
                          <input type="number" class="form-control" name="deductionno" id="deductionno" value="" placeholder="Ex:113" readonly>
                        </div>
                      </div>
                    </div>
                    <div class="row mb-2">
                      <div class="col-lg-12">
                        <div class="form-group">
                          <label class="d-inline-block" for="">月份</label>
                          <ul class="list-unstyled list-inline">
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">1月
                                <input type="radio" name="month" value="1" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">2月
                                <input type="radio" name="month" value="2" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">3月
                                <input type="radio" name="month" value="3" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">4月
                                <input type="radio" name="month" value="4" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">5月
                                <input type="radio" name="month" value="5" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">6月
                                <input type="radio" name="month" value="6" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">7月
                                <input type="radio" name="month" value="7" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">8月
                                <input type="radio" name="month" value="8" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">9月
                                <input type="radio" name="month" value="9" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">10月
                                <input type="radio" name="month" value="10" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">11月
                                <input type="radio" name="month" value="11" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>

                            <li class="d-inline-block mr-3">
                              <label class="control control-radio">12月
                                <input type="radio" name="month" value="12" />
                                <div class="control-indicator"></div>
                              </label>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="table-scroll">
                      <table class="table table-hover">
                        <thead>
                          <tr>
                            <th scope="col">星期</th>
                            <th scope="col">出勤日期</th>
                            <th scope="col">出勤日</th>
                            <th scope="col">不算早退</th>
                            <th scope="col">出勤編號</th>
                            <th scope="col">出勤名稱</th>
                            <th scope="col">打卡</th>
                            <th scope="col">上班時間</th>
                            <th scope="col">下班時間</th>
                            <th scope="col">休息時間1起</th>
                            <th scope="col">休息時間1終</th>
                            <th scope="col">加班上班</th>
                            <th scope="col">加班下班</th>
                            <th scope="col">遲到分數</th>
                            <th scope="col">上班時數</th>
                            <th scope="col">加班時數</th>
                            <th scope="col">請假時數</th>
                            <th scope="col">假別名稱</th>
                            <th scope="col">備註</th>
                          </tr>
                        </thead>
                        <tbody class="datalist">
                        </tbody>
                      </table>
                    </div>
                    <div class="d-flex justify-content-end mt-5">
                      <button type="button" class="btn btn-primary mb-2 mr-2 btn-pill" data-toggle="modal" data-target="#gen_date">
                        產生員工出勤曆
                      </button>
                      <button type="button" class="btn btn-success mb-2 mr-2 btn-pill saveBtn" data-type="deduction_edit" disabled>
                        儲存修改
                      </button>
                      <button type="button" class="btn btn-danger mb-2 btn-pill saveBtn" data-type="deduction_edit" disabled>
                        刪除該月份
                      </button>
                    </div>
                  </form>
                  <!-- Form Modal -->
                  <div class="modal fade" id="gen_date" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalFormTitle">產生員工出勤曆</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>

                        <div class="modal-body">
                          <form id="generate_date" onsubmit="return false;">
                            <div class="form-group">
                              <label for="niadu">產生年度 *</label>
                              <input type="number" class="form-control" name="niadu" id="niadu" aria-describedby="emailHelp" placeholder="EX: 113" data-name="產生年度" required>
                            </div>

                            <div class="form-group">
                              <label for="gen_ed">選擇員工 *</label>
                              <div>
                                <select data-placeholder="查看編號及姓名" id="gen_ed" class="form-control" name="eid[]" data-name="選擇員工" required multiple>
                                  <option value=""></option>
                                  <?php foreach ($employee_list as $key => $value) { ?>
                                    <option value="<?= $value['eid'] ?>"><?= $value['employid'] ?> <?= $value['employname'] ?></option>
                                  <?php } ?>
                                </select>
                              </div>
                            </div>

                            <div class="form-group">
                              <label for="daterange">日期範圍 *</label>
                              <input type="hidden" class="form-control" name="startdate">
                              <input type="hidden" class="form-control" name="enddate">
                              <input type="text" class="form-control" id="daterange" name="daterange" aria-describedby="emailHelp" readonly>
                            </div>

                            <!-- <div class="form-check pl-0">
                              <label class="control control-checkbox">是否填入預設時間
                                <input type="checkbox" checked="checked" />
                                <div class="control-indicator"></div>
                              </label>
                            </div> -->
                            <button type="button" class="btn btn-primary subBtn">產生</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                          </form>
                        </div>
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