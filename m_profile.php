<?php
require_once("include/web.config.php");
if (!$_Login) {
  header("Location:index.php");
  exit;
}

$_Title = '會員中心';
?>
<!DOCTYPE html>
<html dir="ltr" lang="tw">

<head>
  <?php include('m_head.php'); ?>
  <script src="js/m_profile.js"></script>
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
              <div class="col-lg-4 col-xl-3">
                <div class="profile-content-left profile-left-spacing pt-5 pb-3 px-3 px-xl-5">
                  <div class="card text-center widget-profile px-0 border-0">
                    <div class="card-img mx-auto rounded-circle">
                      <img src="images/member_.png" alt="user image">
                    </div>

                    <div class="card-body">
                      <h4 class="py-2 text-dark"><?= $_MemberData['Company_NAME'] ?></h4>
                      <p><?= $_MemberData['Company_EMAIL'] ?></p>
                    </div>
                  </div>

                  <hr class="w-100">

                  <div class="contact-info pt-4">
                    <h5 class="text-dark mb-1">帳號資訊</h5>
                    <p class="text-dark font-weight-medium pt-4 mb-2">帳號狀態</p>
                    <p><?= $_MemberData['Company_Is_Pay'] ? '開通' : '尚未開通' ?></p>
                    <p class="text-dark font-weight-medium pt-4 mb-2">使用版本</p>
                    <p><?= $plan[$_MemberData['Company_Plan']] ?></p>
                    <p class="text-dark font-weight-medium pt-4 mb-2">使用期限</p>
                    <p><?= date('Y-m-d', strtotime($_MemberData['Company_END'])) ?></p>
                    <!-- <p class="text-dark font-weight-medium pt-4 mb-2">Social Profile</p> -->
                    <!-- <p class="pb-3 social-button">
                      <a href="#" class="mb-1 btn btn-outline btn-twitter rounded-circle">
                        <i class="mdi mdi-twitter"></i>
                      </a>

                      <a href="#" class="mb-1 btn btn-outline btn-linkedin rounded-circle">
                        <i class="mdi mdi-linkedin"></i>
                      </a>

                      <a href="#" class="mb-1 btn btn-outline btn-facebook rounded-circle">
                        <i class="mdi mdi-facebook"></i>
                      </a>

                      <a href="#" class="mb-1 btn btn-outline btn-skype rounded-circle">
                        <i class="mdi mdi-skype"></i>
                      </a>
                    </p> -->
                  </div>
                </div>
              </div>

              <div class="col-lg-8 col-xl-9">
                <div class="profile-content-right profile-right-spacing py-5">
                  <ul class="nav nav-tabs px-3 px-xl-5 nav-style-border" id="myTab" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">公司資訊</a>
                    </li>

                    <li class="nav-item">
                      <a class="nav-link" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">帳號設定</a>
                    </li>
                  </ul>

                  <div class="tab-content px-3 px-xl-5" id="myTabContent">
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                      <div class="tab-pane-content mt-5">
                        <form>

                          <div class="row mb-2">
                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="firstName">公司編號</label>
                                <input type="text" class="form-control" id="firstName" value="" placeholder="Ex:A01">
                              </div>
                            </div>

                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="lastName">公司簡號</label>
                                <input type="text" class="form-control" id="lastName" value="" placeholder="Ex:庫點子">
                              </div>
                            </div>
                          </div>

                          <div class="form-group mb-4">
                            <label for="userName">公司名稱</label>
                            <input type="text" class="form-control" id="userName" value="" placeholder="Ex:庫點子文創資訊產業有限公司">
                            <span class="d-block mt-1">請輸入公司全名。</span>
                          </div>

                          <div class="row mb-2">
                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="firstName">負責人</label>
                                <input type="text" class="form-control" id="firstName" value="" placeholder="Ex:廖石龍">
                              </div>
                            </div>

                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="email">電子信箱</label>
                                <input type="email" class="form-control" id="email" value="" placeholder="Ex:bmidp888@gmail.com">
                              </div>
                            </div>
                          </div>

                          <div class="row mb-2">
                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="firstName">公司電話</label>
                                <input type="text" class="form-control" id="firstName" value="" placeholder="Ex:0423586802">
                              </div>
                            </div>

                            <div class="col-lg-6">
                              <div class="form-group">
                                <label for="lastName">公司傳真</label>
                                <input type="text" class="form-control" id="lastName" value="" placeholder="Ex:0423586807">
                              </div>
                            </div>
                          </div>

                          <!-- <div class="form-group mb-4">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" value="albrecht.straub@gmail.com">
                          </div> -->

                          <div class="d-flex justify-content-end mt-5">
                            <button type="submit" class="btn btn-primary mb-2 btn-pill">修改</button>
                          </div>
                        </form>
                      </div>
                    </div>

                    <div class="tab-pane fade show active" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                      <div class="tab-pane-content mt-5">
                        <form>
                          <div class="form-group mb-4">
                            <label for="account">帳號</label>
                            <input type="text" class="form-control" id="account">
                          </div>
                          <div class="form-group mb-4">
                            <label for="oldPassword">舊密碼</label>
                            <input type="password" class="form-control" id="oldPassword">
                          </div>

                          <div class="form-group mb-4">
                            <label for="newPassword">新密碼</label>
                            <input type="password" class="form-control" id="newPassword">
                          </div>

                          <div class="form-group mb-4">
                            <label for="conPassword">重新輸入新密碼</label>
                            <input type="password" class="form-control" id="conPassword">
                          </div>

                          <div class="d-flex justify-content-end mt-5">
                            <button type="submit" class="btn btn-primary mb-2 btn-pill">Update Profile</button>
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