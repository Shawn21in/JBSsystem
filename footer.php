<?php 
$URLweb 	= WEB_URL."system/assets/css/images/";
$logo_url 	= $URLweb.$_setting_['WO_FooterLOGO'];
$footer_url = $URLweb.$_setting_['WO_FooterImg'];

?>
	<footer class="footer">
		<div class="footerBox">
			<p>進銷存軟體．採購訂單．會計系統．票據．製造業．POS系統．發票．固定資產．人事薪資．維修關懷系統．網頁製作．網路行銷</p>
			<p>聯絡電話：04-23502490</p>
			<p class="copyright">版權所有 &copy; 版權所有 2023 庫點子文創資訊產業有限公司 All Rights Reserved </p>
		</div>
	</footer>
	
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script>
        const navToggle = document.querySelector("#navToggle");
		const navClosedIcon = document.querySelector("#navClosed");
		const navOpenIcon = document.querySelector("#navOpen");
		const navIcon = document.querySelectorAll(".navIcon");
		const nav = document.querySelector("nav");

		navToggle.addEventListener("click", () => {
			nav.classList.toggle("open");				
				navIcon.forEach((icon) => {
				icon.classList.toggle("hidden");
			});
		});

	window.addEventListener(
		"resize",
		() => {
			if (document.body.clientWidth > 720) {
				nav.classList.remove("open");
				navIcon.forEach((icon) => {
					icon.classList.remove("hidden");
				});
				navOpenIcon.classList.add("hidden");
			}
		},
		{ passive: false }
	);
    </script>
