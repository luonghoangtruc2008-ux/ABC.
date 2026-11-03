# Tao website EduSmart tu dong bang PowerShell
$ErrorActionPreference = "Stop"

$desktop = [Environment]::GetFolderPath("Desktop")
$folder = Join-Path $desktop "EduSmart"
$file = Join-Path $folder "index.html"

New-Item -ItemType Directory -Path $folder -Force | Out-Null

$html = @'
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EduSmart – Học chăm, Vườn xanh, Điểm cao</title>
<style>
:root{--green:#328b50;--deep:#17633b;--lime:#dff5c8;--cream:#fff8e8;--gold:#ffbd42;--ink:#263b30;--muted:#718078;--line:#e5eddf;--shadow:0 12px 30px #244b2b14}
*{box-sizing:border-box}body{margin:0;background:#f3f8ee;color:var(--ink);font-family:Inter,"Segoe UI",Arial,sans-serif}
button,input,select,textarea{font:inherit}button{cursor:pointer;border:0}
.app{min-height:100vh;display:grid;grid-template-columns:245px 1fr}
.sidebar{background:linear-gradient(180deg,#e8f8db,#f7fbea);padding:24px 16px;border-right:1px solid #dcebd4;position:sticky;top:0;height:100vh}
.brand{font-size:25px;font-weight:900;color:#247b43;letter-spacing:-1px;margin:4px 10px}.brand span{color:#318bd2}.tagline{font-size:11px;color:#63816a;margin:2px 10px 28px}
.profile{display:flex;align-items:center;gap:10px;background:#ffffffb8;padding:12px;border-radius:16px;margin-bottom:22px}.avatar{width:40px;height:40px;border-radius:50%;background:#d5e9ff;display:grid;place-items:center;font-size:23px}
.profile b{display:block;font-size:13px}.profile small{color:#5a9860}
.nav-label{font-size:10px;font-weight:800;color:#88a18a;letter-spacing:1px;margin:18px 10px 8px}
.nav button{display:flex;align-items:center;gap:12px;width:100%;padding:12px 13px;margin:4px 0;border-radius:12px;background:transparent;color:#496151;text-align:left;font-weight:650;font-size:13px}
.nav button:hover,.nav button.active{background:#fff;color:#247b43;box-shadow:0 4px 12px #276b3510}
.nav button .ico{font-size:19px;width:24px;text-align:center}.side-bottom{position:absolute;bottom:18px;left:16px;right:16px;background:#fff;border-radius:14px;padding:13px;font-size:11px;color:#6c7d6d}
.main{min-width:0}.topbar{height:70px;background:#ffffffd9;backdrop-filter:blur(10px);border-bottom:1px solid var(--line);display:flex;align-items:center;justify-content:space-between;padding:0 30px;position:sticky;top:0;z-index:5}
.breadcrumb{font-size:13px;color:#748276}.wallets{display:flex;gap:10px}.wallet{background:#fff8dc;border:1px solid #f4df9c;border-radius:30px;padding:8px 13px;font-size:12px;font-weight:800}
.content{max-width:1250px;margin:auto;padding:28px 30px 60px}.page{display:none}.page.active{display:block}
h1{font-size:27px;margin:0 0 7px;color:#254b31}h2{font-size:19px;margin:0 0 14px}p.sub{margin:0 0 22px;color:#718078;font-size:13px}
.hero{background:linear-gradient(110deg,#dff6d4,#bce9cf 55%,#c7e9ff);border-radius:24px;padding:28px 32px;display:flex;justify-content:space-between;align-items:center;overflow:hidden;box-shadow:var(--shadow);margin-bottom:22px}
.hero h1{font-size:29px;max-width:560px}.hero p{color:#486e51;max-width:560px;line-height:1.6;font-size:14px}.hero-art{font-size:94px;filter:drop-shadow(0 8px 5px #57995b40)}
.btn{padding:10px 16px;border-radius:12px;background:var(--green);color:white;font-weight:750;font-size:13px;box-shadow:0 4px 0 #236a3b}.btn:hover{filter:brightness(1.06);transform:translateY(-1px)}.btn.secondary{background:#fff;color:#34764a;box-shadow:inset 0 0 0 1px #cfe5cc}.btn.gold{background:linear-gradient(#ffdb72,#ffb932);color:#70450a;box-shadow:0 4px 0 #d99221}.btn.red{background:#dc6960;box-shadow:0 4px 0 #b94e48}.btn.small{padding:7px 11px;font-size:11px}
.grid{display:grid;gap:16px}.grid.stats{grid-template-columns:repeat(4,1fr);margin:18px 0 24px}.grid.two{grid-template-columns:1.2fr .8fr}.grid.three{grid-template-columns:repeat(3,1fr)}
.card{background:#fff;border:1px solid var(--line);border-radius:18px;padding:18px;box-shadow:var(--shadow);min-width:0}.stat{display:flex;align-items:center;gap:13px}.stat .bubble{width:43px;height:43px;border-radius:14px;background:#e8f6df;display:grid;place-items:center;font-size:22px}.stat strong{font-size:21px;display:block}.stat small{font-size:11px;color:#819084}
.section-head{display:flex;justify-content:space-between;align-items:center;margin:24px 0 12px}.section-head h2{margin:0}
.quick{display:grid;grid-template-columns:repeat(4,1fr);gap:12px}.quick button{background:#fff;border:1px solid var(--line);border-radius:16px;padding:16px 10px;text-align:center;color:#34523c;font-weight:750;box-shadow:var(--shadow)}.quick button span{display:block;font-size:28px;margin-bottom:7px}
.task{display:flex;align-items:center;gap:12px;padding:12px 0;border-bottom:1px solid #edf1e9}.task:last-child{border:0}.task .task-icon{font-size:24px}.task .task-info{flex:1}.task small{color:#829084}.progress{height:8px;background:#eaf0e7;border-radius:20px;overflow:hidden;margin-top:7px}.progress i{display:block;height:100%;background:#57b76d;border-radius:20px}
.field{width:100%;padding:11px 12px;border:1px solid #dce8d8;border-radius:11px;background:#fff;outline:none;color:#304637}.field:focus{border-color:#69b77b;box-shadow:0 0 0 3px #69b77b22}
.row{display:flex;gap:10px;align-items:center}.row.wrap{flex-wrap:wrap}.row.between{justify-content:space-between}.form-grid{display:grid;grid-template-columns:repeat(2,1fr);gap:12px}.form-grid label{font-size:12px;font-weight:700;color:#647469;display:block}.form-grid input,.form-grid select{margin-top:6px}
.tutor{display:flex;gap:14px;align-items:flex-start}.tutor-avatar{width:58px;height:58px;border-radius:18px;background:#e6f3e2;display:grid;place-items:center;font-size:31px;flex-shrink:0}.tutor h3{font-size:15px;margin:0 0 4px}.muted{color:#7d8c80;font-size:12px}.rating{color:#d69a20;font-size:12px;font-weight:800}.price{color:#247b43;font-weight:850}
.pill{display:inline-block;background:#eef7e9;color:#498251;padding:5px 8px;border-radius:20px;font-size:10px;font-weight:750;margin:3px 3px 3px 0}
.tabs{display:flex;gap:8px;margin:16px 0}.tabs button{padding:9px 13px;border-radius:10px;background:#edf4e9;color:#58705d;font-size:12px;font-weight:700}.tabs button.active{background:#347d49;color:#fff}
.group-card{display:flex;flex-direction:column;gap:9px}.group-icon{font-size:32px}.group-card h3{margin:0;font-size:15px}.group-card p{margin:0;color:#78877c;font-size:12px;line-height:1.5}
.chatbox{height:300px;overflow:auto;background:#f7faf5;border-radius:14px;padding:13px;margin:12px 0;border:1px solid #e8efe4}.msg{max-width:85%;padding:10px 12px;border-radius:13px;margin:8px 0;font-size:13px;line-height:1.5;background:#fff}.msg.me{margin-left:auto;background:#e0f3dc}.chat-compose{display:flex;gap:8px}
.garden-banner{background:linear-gradient(120deg,#c8efc2,#e9f7c9);border-radius:20px;padding:18px 22px;display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}
.garden-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:12px;background:linear-gradient(#d7f2cb,#b8e3a4);padding:18px;border-radius:20px;border:5px solid #e6f5d8}
.plot{min-height:145px;background:linear-gradient(#b8df9d 0 44%,#a86e42 45% 100%);border:3px solid #f2d8a6;border-radius:18px;display:flex;flex-direction:column;align-items:center;justify-content:center;position:relative;color:#fff;text-shadow:0 1px 2px #654322;cursor:pointer;transition:.15s}
.plot:hover{transform:scale(1.02)}.plot .plant{font-size:42px;line-height:1.2}.plot strong{font-size:12px}.plot small{font-size:10px}.plot.empty{background:linear-gradient(#bde8a7 0 40%,#ad754a 41%);font-size:26px}.plot .shield{position:absolute;right:9px;top:7px;font-size:20px}
.seed-choice{display:flex;gap:9px;flex-wrap:wrap}.seed{background:#fff8e7;border:1px solid #f0d7a4;border-radius:12px;padding:10px 13px;font-size:12px;font-weight:750;color:#76552c}
.notice{background:#fff4df;border:1px solid #f3dfb4;padding:12px;border-radius:12px;font-size:12px;color:#775b2c;line-height:1.5}
.modal-backdrop{display:none;position:fixed;inset:0;background:#13271db0;z-index:20;align-items:center;justify-content:center;padding:18px}.modal-backdrop.show{display:flex}.modal{width:min(520px,100%);background:#fff;border-radius:20px;padding:23px;box-shadow:0 20px 60px #0003;max-height:90vh;overflow:auto}.modal h2{margin-bottom:8px}.modal-close{float:right;background:#f0f4ee;border-radius:50%;width:30px;height:30px}
.toast{position:fixed;right:22px;bottom:22px;background:#234d32;color:white;padding:13px 18px;border-radius:12px;box-shadow:var(--shadow);z-index:30;opacity:0;transform:translateY(10px);transition:.25s;pointer-events:none;font-size:13px}.toast.show{opacity:1;transform:translateY(0)}
table{width:100%;border-collapse:collapse;font-size:12px}td,th{text-align:left;padding:11px;border-bottom:1px solid #edf1e9}th{color:#7b8b7d}
@media(max-width:900px){.app{grid-template-columns:75px 1fr}.sidebar{padding:18px 9px}.brand{font-size:0}.brand:after{content:"ES";font-size:22px}.tagline,.profile div:not(.avatar),.nav-label,.nav button .nav-text,.side-bottom{display:none}.profile{justify-content:center;padding:8px}.nav button{justify-content:center;padding:12px 4px}.nav button .ico{font-size:21px}.content{padding:20px 16px}.topbar{padding:0 16px}.grid.stats{grid-template-columns:repeat(2,1fr)}}
@media(max-width:600px){.app{display:block}.sidebar{height:auto;position:sticky;top:0;z-index:10;padding:8px;background:#e9f7df}.brand,.tagline,.profile,.nav-label,.side-bottom{display:none}.nav{display:flex;overflow:auto}.nav button{min-width:55px;margin:0}.nav button .nav-text{display:none}.topbar{height:55px}.content{padding:15px 12px}.hero{padding:20px}.hero-art{font-size:55px}.hero h1{font-size:22px}.quick{grid-template-columns:repeat(2,1fr)}.grid.two,.grid.three{grid-template-columns:1fr}.garden-grid{gap:7px;padding:9px}.plot{min-height:110px}.form-grid{grid-template-columns:1fr}}
</style>
</head>
<body>
<div class="app">
<aside class="sidebar">
  <div class="brand">Edu<span>Smart</span>+</div><div class="tagline">Học chăm • Vườn xanh • Điểm cao</div>
  <div class="profile"><div class="avatar">🧑‍🎓</div><div><b>Minh Anh</b><small>Thành viên Lv.12</small></div></div>
  <div class="nav-label">KHÔNG GIAN HỌC TẬP</div>
  <nav class="nav">
    <button class="active" data-page="home"><span class="ico">🏡</span><span class="nav-text">Trang chủ</span></button>
    <button data-page="tutors"><span class="ico">👩‍🏫</span><span class="nav-text">Tìm giảng viên</span></button>
    <button data-page="booking"><span class="ico">📅</span><span class="nav-text">Lịch học của tôi</span></button>
    <button data-page="groups"><span class="ico">👥</span><span class="nav-text">Nhóm học tập</span></button>
    <button data-page="classroom"><span class="ico">🤖</span><span class="nav-text">Phòng học AI</span></button>
    <button data-page="market"><span class="ico">📚</span><span class="nav-text">Chợ tài liệu</span></button>
  </nav>
  <div class="nav-label">GIẢI TRÍ & PHÁT TRIỂN</div>
  <nav class="nav">
    <button data-page="garden"><span class="ico">🌱</span><span class="nav-text">Khu vườn tri thức</span></button>
    <button data-page="achievements"><span class="ico">🏆</span><span class="nav-text">Thành tích</span></button>
    <button data-page="wallet"><span class="ico">🪙</span><span class="nav-text">Ví của tôi</span></button>
  </nav>
  <div class="side-bottom">🌿 Mỗi ngày học một chút, khu vườn sẽ lớn lên!</div>
</aside>
<main class="main">
<header class="topbar"><div class="breadcrumb" id="crumb">Trang chủ / Tổng quan</div><div class="wallets"><span class="wallet">🪙 <b id="coinTop">12.540</b></span><span class="wallet">🌱 <b id="seedTop">850</b></span></div></header>
<div class="content">
<section class="page active" id="home">
  <div class="hero"><div><span class="pill">CHÀO MỪNG BẠN ĐẾN VỚI EDUSMART</span><h1>Học tập thông minh, phát triển mỗi ngày! 🌿</h1><p>Kết nối với giảng viên phù hợp, học cùng cộng đồng và biến mỗi giờ học thành một bước phát triển trong khu vườn tri thức của bạn.</p><button class="btn" onclick="go('tutors')">Tìm người dạy ngay →</button></div><div class="hero-art">🌳📖</div></div>
  <div class="grid stats">
    <div class="card stat"><div class="bubble">📘</div><div><strong>12 giờ</strong><small>Thời gian học tháng này</small></div></div>
    <div class="card stat"><div class="bubble">🌱</div><div><strong id="statPlants">4 cây</strong><small>Cây trong khu vườn</small></div></div>
    <div class="card stat"><div class="bubble">🏅</div><div><strong>Lv.12</strong><small>Cấp độ học tập</small></div></div>
    <div class="card stat"><div class="bubble">⭐</div><div><strong>4.9/5</strong><small>Đánh giá học tập</small></div></div>
  </div>
  <div class="section-head"><h2>Khám phá EduSmart</h2></div>
  <div class="quick">
    <button onclick="go('tutors')"><span>👩‍🏫</span>Tìm giảng viên</button>
    <button onclick="go('groups')"><span>👥</span>Nhóm cộng đồng</button>
    <button onclick="go('classroom')"><span>🤖</span>Phòng học AI</button>
    <button onclick="go('garden')"><span>🌻</span>Khu vườn game</button>
  </div>
  <div class="grid two">
    <div><div class="section-head"><h2>Nhiệm vụ hôm nay</h2><button class="btn secondary small" onclick="go('achievements')">Xem tất cả</button></div>
      <div class="card">
        <div class="task"><span class="task-icon">📖</span><div class="task-info"><b>Học tập 30 phút</b><div class="progress"><i style="width:70%"></i></div><small>21/30 phút</small></div><button class="btn small" onclick="completeTask('Học tập 30 phút')">Nhận +50</button></div>
        <div class="task"><span class="task-icon">💬</span><div class="task-info"><b>Tham gia thảo luận</b><div class="progress"><i style="width:0%"></i></div><small>Chưa hoàn thành</small></div><button class="btn small" onclick="completeTask('Tham gia thảo luận')">Làm ngay</button></div>
        <div class="task"><span class="task-icon">🌱</span><div class="task-info"><b>Chăm sóc khu vườn</b><div class="progress"><i style="width:35%"></i></div><small>1/3 hoạt động</small></div><button class="btn small" onclick="go('garden')">Chăm cây</button></div>
      </div>
    </div>
    <div><div class="section-head"><h2>Lịch học sắp tới</h2></div><div class="card"><div class="row"><div class="bubble">🗓️</div><div><b>Tiếng Anh giao tiếp</b><div class="muted">Hôm nay • 19:00 – 19:45</div></div></div><hr style="border:0;border-top:1px solid #edf1e9;margin:14px 0"><div class="row between"><span class="muted">Giảng viên: Cô Minh Thư</span><button class="btn small" onclick="go('booking')">Chi tiết</button></div></div></div>
  </div>
</section>

<section class="page" id="tutors">
  <h1>Kết nối người học – người dạy</h1><p class="sub">Tìm giảng viên phù hợp với mục tiêu, môn học và thời gian của bạn.</p>
  <div class="card">
    <div class="row wrap"><input id="tutorSearch" class="field" style="flex:1;min-width:180px" placeholder="Tìm theo tên hoặc môn học..." oninput="renderTutors()"><select id="subjectFilter" class="field" style="max-width:190px" onchange="renderTutors()"><option value="">Tất cả môn học</option><option>Tiếng Anh</option><option>Toán</option><option>Hóa học</option><option>Sinh học</option><option>Vật lý</option></select></div>
  </div>
  <div class="section-head"><h2>Giảng viên nổi bật</h2><span class="muted">Hồ sơ đã xác minh ✓</span></div><div class="grid two" id="tutorList"></div>
</section>

<section class="page" id="booking">
  <h1>Lịch học của tôi</h1><p class="sub">Quản lý các buổi học đã đặt và xác nhận lịch với giảng viên.</p>
  <div class="card"><div class="section-head" style="margin-top:0"><h2>Đặt buổi học mới</h2><span class="pill">Thời lượng 45 phút</span></div>
    <div class="form-grid">
      <label>Chọn giảng viên<select id="bookTutor" class="field"></select></label>
      <label>Môn học<select id="bookSubject" class="field"><option>Tiếng Anh</option><option>Toán</option><option>Hóa học</option><option>Sinh học</option><option>Vật lý</option></select></label>
      <label>Ngày học<input id="bookDate" type="date" class="field"></label>
      <label>Khung giờ<select id="bookTime" class="field"><option>08:00 – 08:45</option><option>09:00 – 09:45</option><option>14:00 – 14:45</option><option>19:00 – 19:45</option><option>20:00 – 20:45</option></select></label>
    </div><div class="row between" style="margin-top:16px"><span class="muted">Học phí dự kiến: <b class="price">120.000đ / 45 phút</b></span><button class="btn gold" onclick="confirmBooking()">Xác nhận & thanh toán</button></div>
  </div>
  <div class="section-head"><h2>Buổi học đã đặt</h2></div><div class="card" id="bookingList"></div>
</section>

<section class="page" id="groups">
  <h1>Nhóm học tập cộng đồng</h1><p class="sub">Cùng nhau giải bài tập, chia sẻ tài liệu và tạo động lực học tập.</p>
  <div class="row wrap"><input id="groupSearch" class="field" placeholder="Tìm nhóm học tập..." style="max-width:360px" oninput="renderGroups()"><button class="btn" onclick="openCreateGroup()">＋ Tạo nhóm học</button></div>
  <div class="section-head"><h2>Nhóm nổi bật</h2><span class="muted">Học cùng nhau tiến bộ cùng nhau</span></div><div class="grid three" id="groupList"></div>
</section>

<section class="page" id="classroom">
  <h1>Phòng học AI – Trợ lý học tập</h1><p class="sub">Đặt câu hỏi, luyện tập và nhận gợi ý học tập theo nhu cầu của bạn.</p>
  <div class="grid two">
    <div class="card"><div class="row"><div class="bubble">🤖</div><div><b>EduAI Assistant</b><div class="muted">Trợ lý học tập mô phỏng • Luôn sẵn sàng</div></div></div>
      <div class="chatbox" id="chatbox"><div class="msg">Xin chào Minh Anh! 👋 Mình có thể giúp bạn giải thích kiến thức, gợi ý cách học hoặc luyện tiếng Anh. Hôm nay bạn muốn học gì?</div></div>
      <div class="chat-compose"><input id="chatInput" class="field" placeholder="Nhập câu hỏi của bạn..." onkeydown="if(event.key==='Enter')sendChat()"><button class="btn" onclick="sendChat()">Gửi</button></div>
    </div>
    <div class="card"><h2>Công cụ học nhanh</h2><div class="grid">
      <button class="btn secondary" onclick="quickPrompt('Hãy tạo 5 câu hỏi trắc nghiệm tiếng Anh cơ bản cho mình.')">📝 Tạo câu hỏi luyện tập</button>
      <button class="btn secondary" onclick="quickPrompt('Hãy giải thích một kiến thức khó theo cách dễ hiểu và có ví dụ.')">💡 Giải thích kiến thức</button>
      <button class="btn secondary" onclick="quickPrompt('Hãy giúp mình lập kế hoạch học tập trong 7 ngày.')">📅 Lập kế hoạch học</button>
      <button class="btn secondary" onclick="quickPrompt('Hãy luyện hội thoại tiếng Anh cơ bản với mình.')">🗣️ Luyện giao tiếp</button>
    </div><div class="notice" style="margin-top:16px">Lưu ý: Đây là giao diện AI minh họa cho bài thuyết trình. Câu trả lời được mô phỏng, chưa kết nối với dịch vụ AI thật.</div></div>
  </div>
</section>

<section class="page" id="market">
  <h1>Chợ tài liệu học tập</h1><p class="sub">Khám phá, chia sẻ và giao dịch tài liệu học tập trong cộng đồng.</p>
  <div class="row wrap"><input id="marketSearch" class="field" placeholder="Tìm tài liệu..." style="max-width:350px" oninput="renderMarket()"><select id="marketType" class="field" style="max-width:180px" onchange="renderMarket()"><option value="">Tất cả danh mục</option><option>Tiếng Anh</option><option>Y khoa</option><option>Toán</option></select><button class="btn" onclick="notify('Tính năng đăng bán tài liệu đang ở chế độ minh họa.')">＋ Đăng tài liệu</button></div>
  <div class="section-head"><h2>Tài liệu được quan tâm</h2></div><div class="grid three" id="marketList"></div>
</section>

<section class="page" id="garden">
  <div class="garden-banner"><div><span class="pill">GAME HỌC TẬP</span><h1>🌿 Khu vườn tri thức</h1><p class="sub" style="margin:6px 0 0">Học tập chăm chỉ để gieo hạt, chăm cây và thu hoạch phần thưởng!</p></div><div style="font-size:65px">🌻🌳</div></div>
  <div class="grid stats">
    <div class="card stat"><div class="bubble">🪙</div><div><strong id="gardenCoins">12.540</strong><small>Xu hiện có</small></div></div>
    <div class="card stat"><div class="bubble">🌱</div><div><strong id="gardenSeeds">850</strong><small>Hạt giống</small></div></div>
    <div class="card stat"><div class="bubble">🌼</div><div><strong id="gardenCount">4</strong><small>Ô cây đang trồng</small></div></div>
    <div class="card stat"><div class="bubble">🛡️</div><div><strong id="shieldCount">1</strong><small>Lá chắn bảo vệ</small></div></div>
  </div>
  <div class="grid two">
    <div class="card"><div class="section-head" style="margin-top:0"><h2>🌳 Khu vườn của bạn</h2><button class="btn secondary small" onclick="showGardenHelp()">Cách chơi</button></div>
      <div class="notice" style="margin-bottom:12px">⏳ Cây cần thời gian phát triển. Khi cây trưởng thành, hãy thu hoạch để nhận xu và điểm thưởng.</div>
      <div class="garden-grid" id="gardenGrid"></div>
      <div class="row between" style="margin-top:12px"><span class="muted">Chọn ô đất để trồng hoặc chăm sóc cây.</span><button class="btn gold" onclick="plantSelected()">🌱 Trồng cây đã chọn</button></div>
    </div>
    <div class="card"><h2>🌷 Chọn hạt giống</h2><p class="muted">Mỗi loại cây có giá và phần thưởng khác nhau.</p><div class="seed-choice" id="seedChoices"></div>
      <hr style="border:0;border-top:1px solid #edf1e9;margin:17px 0"><h2>🎯 Nhiệm vụ nhận hạt</h2>
      <div class="task"><span class="task-icon">📖</span><div class="task-info"><b>Học 30 phút</b><small>Hoàn thành một phiên học</small></div><button class="btn small" onclick="gardenReward('Học 30 phút',50)">+50 🌱</button></div>
      <div class="task"><span class="task-icon">👥</span><div class="task-info"><b>Tham gia nhóm học</b><small>Học cùng cộng đồng</small></div><button class="btn small" onclick="gardenReward('Tham gia nhóm học',40)">+40 🌱</button></div>
      <div class="task"><span class="task-icon">🤖</span><div class="task-info"><b>Hỏi EduAI</b><small>Đặt một câu hỏi học tập</small></div><button class="btn small" onclick="gardenReward('Hỏi EduAI',30)">+30 🌱</button></div>
      <hr style="border:0;border-top:1px solid #edf1e9;margin:17px 0"><h2>🛡️ Bảo vệ khu vườn</h2><p class="muted">Dùng lá chắn để bảo vệ cây khỏi sự kiện Trộm cây.</p><button class="btn secondary" onclick="buyShield()">Mua lá chắn – 100 xu</button>
    </div>
  </div>
  <div class="card" style="margin-top:16px"><div class="row between"><div><h2>🎁 Sự kiện đặc biệt</h2><p class="muted">Sự kiện sinh nhật và các thử thách theo mùa.</p></div><button class="btn gold" onclick="birthdayEvent()">Nhận quà sinh nhật</button></div><div class="notice">Trong sự kiện Trộm cây, khu vườn có thể bị mất một phần điểm cây nếu chưa được bảo vệ. Đây là cơ chế trò chơi mô phỏng; bạn có thể dùng lá chắn để giảm rủi ro.</div></div>
</section>

<section class="page" id="achievements">
  <h1>Thành tích học tập</h1><p class="sub">Theo dõi sự tiến bộ và nhận phần thưởng khi duy trì thói quen học tập.</p>
  <div class="grid three">
    <div class="card"><div style="font-size:32px">📚</div><h2>Người chăm học</h2><p class="muted">Hoàn thành 10 phiên học</p><span class="pill">Đã đạt</span></div>
    <div class="card"><div style="font-size:32px">🌱</div><h2>Mầm xanh</h2><p class="muted">Trồng 5 cây trong vườn</p><span class="pill">Đang thực hiện</span></div>
    <div class="card"><div style="font-size:32px">🤝</div><h2>Học cùng bạn</h2><p class="muted">Tham gia 3 nhóm học tập</p><span class="pill">Đang thực hiện</span></div>
  </div>
</section>

<section class="page" id="wallet">
  <h1>Ví EduSmart</h1><p class="sub">Quản lý xu, hạt giống và các giao dịch mô phỏng trên nền tảng.</p>
  <div class="grid two"><div class="card"><div class="muted">Số dư xu</div><div style="font-size:34px;font-weight:900;margin:8px 0" id="walletCoins">12.540 🪙</div><button class="btn gold" onclick="notify('Đây là ví demo – không phát sinh giao dịch tiền thật.')">＋ Nạp xu (mô phỏng)</button></div><div class="card"><div class="muted">Hạt giống</div><div style="font-size:34px;font-weight:900;margin:8px 0" id="walletSeeds">850 🌱</div><p class="muted">Nhận hạt giống thông qua hoạt động học tập và nhiệm vụ.</p></div></div>
  <div class="section-head"><h2>Lịch sử hoạt động</h2></div><div class="card"><table><thead><tr><th>Hoạt động</th><th>Thời gian</th><th>Trạng thái</th></tr></thead><tbody id="historyRows"><tr><td>Thưởng đăng nhập</td><td>Hôm nay</td><td><span class="pill">Thành công</span></td></tr><tr><td>Hoàn thành bài học</td><td>Hôm qua</td><td><span class="pill">Thành công</span></td></tr></tbody></table></div>
</section>
</div></main></div>

<div class="modal-backdrop" id="modalBackdrop" onclick="if(event.target===this)closeModal()"><div class="modal"><button class="modal-close" onclick="closeModal()">✕</button><div id="modalContent"></div></div></div>
<div class="toast" id="toast"></div>

<script>
const tutors=[
{id:1,name:"Cô Nguyễn Thu Hà",subject:"Tiếng Anh",exp:"5 năm kinh nghiệm",rating:"4.9",reviews:128,price:"120.000đ",emoji:"👩🏻‍🏫",desc:"Giao tiếp, ngữ pháp và luyện phát âm. Phương pháp học dễ hiểu, tương tác."},
{id:2,name:"Thầy Lê Minh Vũ",subject:"Toán",exp:"7 năm kinh nghiệm",rating:"4.8",reviews:96,price:"150.000đ",emoji:"👨🏻‍🏫",desc:"Toán cơ bản và nâng cao, hướng dẫn giải bài theo từng bước."},
{id:3,name:"Cô Phạm Linh Chi",subject:"Hóa học",exp:"4 năm kinh nghiệm",rating:"4.9",reviews:83,price:"130.000đ",emoji:"👩🏼‍🔬",desc:"Hệ thống kiến thức Hóa học, luyện bài tập và mẹo ghi nhớ."},
{id:4,name:"Thầy Trần Quốc Bảo",subject:"Sinh học",exp:"6 năm kinh nghiệm",rating:"5.0",reviews:74,price:"140.000đ",emoji:"🧑🏻‍🔬",desc:"Sinh học tế bào, di truyền và các chuyên đề sinh học."},
{id:5,name:"Cô Hoàng Ngọc Mai",subject:"Vật lý",exp:"3 năm kinh nghiệm",rating:"4.7",reviews:52,price:"110.000đ",emoji:"👩🏻‍💻",desc:"Giải thích hiện tượng vật lý bằng ví dụ trực quan."}
];
let coins=12540,seeds=850,selectedSeed="🌻 Hoa hướng dương",selectedPlot=0,shield=1,joinedGroups=[],bookings=[],claimed={};
const seedTypes=[{name:"🌻 Hoa hướng dương",cost:50,reward:100,time:15,emoji:"🌻"},{name:"💐 Hoa oải hương",cost:50,reward:110,time:20,emoji:"💐"},{name:"🍓 Dâu tây",cost:70,reward:150,time:25,emoji:"🍓"},{name:"🌼 Hoa cúc",cost:60,reward:120,time:18,emoji:"🌼"}];
let plots=[{plant:"🌻",name:"Hoa hướng dương",ready:true,protected:false},{plant:"💐",name:"Hoa oải hương",ready:true,protected:false},{plant:"🍓",name:"Dâu tây",ready:false,protected:false},{plant:"🌱",name:"Mầm cây",ready:false,protected:true},null,null,null,null,null];
const groups=[
{icon:"📘",name:"Ôn thi THPTQG 2027",desc:"Cùng giải đề, chia sẻ tài liệu và chữa bài mỗi tuần.",members:128,tag:"Toán • Lý • Hóa"},
{icon:"🇬🇧",name:"IELTS 6.5 Community",desc:"Luyện Speaking, Writing và trao đổi tài liệu tiếng Anh.",members:86,tag:"Tiếng Anh"},
{icon:"🧬",name:"Sinh viên khối ngành sức khỏe",desc:"Chia sẻ kiến thức sinh học, y khoa và kinh nghiệm học tập.",members:64,tag:"Y khoa"},
{icon:"💻",name:"Tin học cho người mới",desc:"Học kỹ năng máy tính, Word, Excel và thuyết trình.",members:92,tag:"Tin học"}
];
const products=[
{icon:"📗",name:"Tổng hợp ngữ pháp tiếng Anh",type:"Tiếng Anh",price:25000,owner:"Minh Anh"},
{icon:"🧬",name:"Flashcard Sinh học tế bào",type:"Y khoa",price:30000,owner:"Study Lab"},
{icon:"📐",name:"Bộ đề Toán có lời giải",type:"Toán",price:20000,owner:"Gia sư Online"},
{icon:"📝",name:"Từ vựng tiếng Anh theo chủ đề",type:"Tiếng Anh",price:15000,owner:"English Club"},
{icon:"🩺",name:"Tóm tắt thuật ngữ y khoa",type:"Y khoa",price:35000,owner:"Med Notes"}
];
function fmt(n){return n.toLocaleString("vi-VN")}
function updateWallet(){["coinTop","gardenCoins","walletCoins"].forEach(id=>{let e=document.getElementById(id);if(e)e.textContent=id==="walletCoins"?fmt(coins)+" 🪙":fmt(coins)});["seedTop","gardenSeeds","walletSeeds"].forEach(id=>{let e=document.getElementById(id);if(e)e.textContent=fmt(seeds)});document.getElementById("shieldCount").textContent=shield;document.getElementById("gardenCount").textContent=plots.filter(Boolean).length;document.getElementById("statPlants").textContent=plots.filter(Boolean).length+" cây"}
function notify(msg){let t=document.getElementById("toast");t.textContent=msg;t.classList.add("show");setTimeout(()=>t.classList.remove("show"),2600)}
function go(page){document.querySelectorAll(".page").forEach(p=>p.classList.remove("active"));document.getElementById(page).classList.add("active");document.querySelectorAll(".nav button").forEach(b=>b.classList.toggle("active",b.dataset.page===page));let names={home:"Trang chủ / Tổng quan",tutors:"Kết nối người dạy",booking:"Lịch học",groups:"Cộng đồng học tập",classroom:"Phòng học AI",market:"Chợ tài liệu",garden:"Khu vườn tri thức",achievements:"Thành tích",wallet:"Ví EduSmart"};document.getElementById("crumb").textContent=names[page];if(page==="garden")renderGarden();if(page==="tutors")renderTutors();if(page==="booking")renderBookings();if(page==="groups")renderGroups();if(page==="market")renderMarket();window.scrollTo({top:0,behavior:"smooth"})}
document.querySelectorAll(".nav button").forEach(b=>b.addEventListener("click",()=>go(b.dataset.page)));
function renderTutors(){let q=(document.getElementById("tutorSearch")?.value||"").toLowerCase(),s=document.getElementById("subjectFilter")?.value||"";let list=tutors.filter(t=>(t.name.toLowerCase().includes(q)||t.subject.toLowerCase().includes(q))&&(!s||t.subject===s));document.getElementById("tutorList").innerHTML=list.map(t=>`<div class="card"><div class="tutor"><div class="tutor-avatar">${t.emoji}</div><div style="flex:1"><h3>${t.name} <span class="pill">✓ Đã xác minh</span></h3><div class="muted">${t.subject} • ${t.exp}</div><div class="rating">★ ${t.rating} <span class="muted">(${t.reviews} đánh giá)</span></div><p class="muted">${t.desc}</p><div class="row between"><span class="price">${t.price}/buổi</span><button class="btn small" onclick="viewTutor(${t.id})">Xem hồ sơ</button></div></div></div></div>`).join("")||'<div class="card">Không tìm thấy giảng viên phù hợp.</div>'}
function viewTutor(id){let t=tutors.find(x=>x.id===id);openModal(`<h2>${t.emoji} ${t.name}</h2><span class="pill">✓ Hồ sơ đã xác minh</span><p class="muted">${t.subject} • ${t.exp}</p><p>${t.desc}</p><p class="rating">★ ${t.rating}/5 – ${t.reviews} lượt đánh giá</p><p class="price">${t.price} / 45 phút</p><div class="notice">Hồ sơ giảng viên hiển thị chuyên môn, kinh nghiệm, lịch trống và đánh giá từ người học.</div><button class="btn" style="margin-top:15px" onclick="document.getElementById('bookTutor').value='${t.id}';closeModal();go('booking')">Đặt lịch với giảng viên</button>`)}
function initBooking(){document.getElementById("bookTutor").innerHTML=tutors.map(t=>`<option value="${t.id}">${t.name}</option>`).join("");let d=new Date();d.setDate(d.getDate()+1);document.getElementById("bookDate").value=d.toISOString().slice(0,10);document.getElementById("bookDate").min=d.toISOString().slice(0,10)}
function confirmBooking(){let id=+document.getElementById("bookTutor").value,t=tutors.find(x=>x.id===id),date=document.getElementById("bookDate").value,time=document.getElementById("bookTime").value,subject=document.getElementById("bookSubject").value;if(!date){notify("Vui lòng chọn ngày học.");return}openModal(`<h2>📅 Xác nhận đặt lịch</h2><p><b>Giảng viên:</b> ${t.name}</p><p><b>Môn học:</b> ${subject}</p><p><b>Thời gian:</b> ${date} • ${time}</p><p><b>Thời lượng:</b> 45 phút</p><p class="price">Tổng thanh toán: 120.000đ</p><div class="notice">Đây là thanh toán mô phỏng phục vụ trình diễn, không trừ tiền thật.</div><button class="btn gold" style="margin-top:14px" onclick="finishBooking(${id},'${date}','${time}','${subject}')">Xác nhận thanh toán demo</button>`)}
function finishBooking(id,date,time,subject){let t=tutors.find(x=>x.id===id);bookings.push({name:t.name,date,time,subject,status:"Đã xác nhận"});closeModal();renderBookings();notify("Đặt lịch thành công! Buổi học đã được thêm vào lịch.");}
function renderBookings(){let el=document.getElementById("bookingList");el.innerHTML=bookings.length?bookings.map((b,i)=>`<div class="task"><span class="task-icon">📘</span><div class="task-info"><b>${b.subject} – ${b.name}</b><small>${b.date} • ${b.time} • 45 phút</small></div><span class="pill">${b.status}</span><button class="btn small" onclick="joinClass(${i})">Vào lớp</button><button class="btn red small" onclick="cancelBooking(${i})">Hủy</button></div>`).join(""):'<p class="muted">Bạn chưa có buổi học nào được đặt. Hãy tìm giảng viên để bắt đầu nhé!</p>'}
function joinClass(i){openModal(`<h2>🎥 Phòng học trực tuyến</h2><div style="background:#e8f4e4;border-radius:16px;padding:35px;text-align:center;font-size:58px">👩‍🏫 💻</div><p><b>${bookings[i].subject}</b> cùng ${bookings[i].name}</p><p class="muted">Phòng học mô phỏng: camera, micro, chat và chia sẻ tài liệu.</p><div class="row wrap"><button class="btn" onclick="notify('Micro đã bật (mô phỏng).')">🎙️ Micro</button><button class="btn secondary" onclick="notify('Camera đã bật (mô phỏng).')">📷 Camera</button><button class="btn secondary" onclick="notify('Đã mở khung chat lớp học.')">💬 Chat</button></div>`)}
function cancelBooking(i){bookings.splice(i,1);renderBookings();notify("Đã hủy buổi học.")}
function renderGroups(){let q=(document.getElementById("groupSearch")?.value||"").toLowerCase();document.getElementById("groupList").innerHTML=groups.filter(g=>g.name.toLowerCase().includes(q)||g.tag.toLowerCase().includes(q)).map((g,i)=>`<div class="card group-card"><div class="group-icon">${g.icon}</div><h3>${g.name}</h3><p>${g.desc}</p><div class="row between"><span class="muted">👥 ${g.members} thành viên</span><span class="pill">${g.tag}</span></div><button class="btn ${joinedGroups.includes(i)?"secondary":""}" onclick="toggleGroup(${i})">${joinedGroups.includes(i)?"✓ Đã tham gia – Rời nhóm":"Tham gia nhóm"}</button></div>`).join("")||'<div class="card">Không tìm thấy nhóm.</div>'}
function toggleGroup(i){if(joinedGroups.includes(i)){joinedGroups=joinedGroups.filter(x=>x!==i);notify("Bạn đã rời nhóm.")}else{joinedGroups.push(i);notify("Tham gia nhóm thành công! +40 hạt giống");seeds+=40;updateWallet()}renderGroups()}
function openCreateGroup(){openModal(`<h2>＋ Tạo nhóm học tập</h2><label class="muted">Tên nhóm</label><input id="newGroupName" class="field" placeholder="Ví dụ: Cùng học tiếng Anh"><label class="muted" style="display:block;margin-top:12px">Mô tả</label><textarea id="newGroupDesc" class="field" rows="3" placeholder="Nhóm học về chủ đề gì?"></textarea><button class="btn" style="margin-top:14px" onclick="createGroup()">Tạo nhóm</button>`)}
function createGroup(){let n=document.getElementById("newGroupName").value.trim(),d=document.getElementById("newGroupDesc").value.trim();if(!n){notify("Hãy nhập tên nhóm.");return}groups.unshift({icon:"🌟",name:n,desc:d||"Nhóm học tập mới của cộng đồng EduSmart.",members:1,tag:"Cộng đồng"});closeModal();renderGroups();notify("Đã tạo nhóm học tập!")}
function sendChat(){let input=document.getElementById("chatInput"),v=input.value.trim();if(!v)return;let box=document.getElementById("chatbox");box.innerHTML+=`<div class="msg me">${escapeHTML(v)}</div>`;input.value="";let answer="Mình đã nhận được câu hỏi của bạn! Bạn hãy chia nhỏ nội dung, xác định phần chưa hiểu và thử làm từng bước nhé. Đây là phản hồi minh họa của EduAI trong bản demo.";if(/tiếng anh|english/i.test(v))answer="Bạn có thể bắt đầu bằng những câu ngắn, luyện từ vựng theo chủ đề và thực hành mỗi ngày. Mình có thể cùng bạn tạo một đoạn hội thoại đơn giản nhé!";if(/toán|phương trình/i.test(v))answer="Với bài Toán, hãy xác định dữ kiện, chọn công thức phù hợp rồi giải từng bước. Bạn có thể gửi nội dung bài tập cụ thể để được hỗ trợ.";box.innerHTML+=`<div class="msg">🤖 ${answer}</div>`;box.scrollTop=box.scrollHeight}
function quickPrompt(v){document.getElementById("chatInput").value=v;sendChat()}
function renderMarket(){let q=(document.getElementById("marketSearch")?.value||"").toLowerCase(),type=document.getElementById("marketType")?.value||"";document.getElementById("marketList").innerHTML=products.filter(p=>(p.name.toLowerCase().includes(q)||p.type.toLowerCase().includes(q))&&(!type||p.type===type)).map((p,i)=>`<div class="card"><div style="font-size:37px">${p.icon}</div><h3 style="font-size:15px">${p.name}</h3><span class="pill">${p.type}</span><p class="muted">Người đăng: ${p.owner}</p><div class="row between"><b class="price">${fmt(p.price)}đ</b><button class="btn small" onclick="buyProduct(${i})">Xem / Mua</button></div></div>`).join("")}
function buyProduct(i){let p=products[i];openModal(`<h2>${p.icon} ${p.name}</h2><p class="muted">Danh mục: ${p.type} • Người đăng: ${p.owner}</p><h2 class="price">${fmt(p.price)}đ</h2><div class="notice">Giao dịch chỉ mô phỏng để trình bày quy trình mua tài liệu. Không có thanh toán thật.</div><button class="btn gold" style="margin-top:14px" onclick="closeModal();notify('Đã mua tài liệu thành công (mô phỏng).')">Xác nhận mua</button>`)}
function completeTask(name){if(claimed[name]){notify("Bạn đã nhận thưởng nhiệm vụ này rồi!");return}claimed[name]=true;seeds+=50;updateWallet();notify("Hoàn thành "+name+"! +50 hạt giống 🌱")}
function gardenReward(name,amount){if(claimed[name]){notify("Nhiệm vụ này đã nhận thưởng hôm nay.");return}claimed[name]=true;seeds+=amount;updateWallet();notify("Hoàn thành nhiệm vụ: "+name+"! +"+amount+" hạt giống")}
function renderGarden(){document.getElementById("gardenGrid").innerHTML=plots.map((p,i)=>p?`<div class="plot" onclick="selectPlot(${i})" style="${selectedPlot===i?'outline:4px solid #fff;box-shadow:0 0 0 6px #4e9d55':''}"><span class="plant">${p.plant}</span><strong>${p.name}</strong><small>${p.ready?"Đã trưởng thành – chạm để thu hoạch":"Đang phát triển"}</small>${p.protected?'<span class="shield">🛡️</span>':""}</div>`:`<div class="plot empty" onclick="selectPlot(${i})" style="${selectedPlot===i?'outline:4px solid #fff;box-shadow:0 0 0 6px #4e9d55':''}">＋<small>Ô đất trống</small></div>`).join("");document.getElementById("seedChoices").innerHTML=seedTypes.map(s=>`<button class="seed" onclick="selectedSeed='${s.name}';renderGarden();notify('Đã chọn '+s.name)">${s.emoji} ${s.name.split(" ").slice(1).join(" ")}<br>🌱 ${s.cost} • 🪙 ${s.reward}</button>`).join("");updateWallet()}
function selectPlot(i){selectedPlot=i;let p=plots[i];if(p&&p.ready){openModal(`<h2>${p.plant} ${p.name}</h2><p>Cây đã trưởng thành và sẵn sàng thu hoạch.</p><button class="btn gold" onclick="harvest(${i})">Thu hoạch cây</button> <button class="btn secondary" onclick="protectPlot(${i})">🛡️ Bảo vệ cây</button>`)}else if(p){openModal(`<h2>${p.plant} ${p.name}</h2><p class="muted">Cây đang phát triển. Hãy quay lại sau để thu hoạch nhé!</p><button class="btn secondary" onclick="protectPlot(${i})">🛡️ Bảo vệ cây</button>`)}else{renderGarden();notify("Đã chọn ô đất số "+(i+1)+". Chọn hạt giống rồi bấm Trồng cây.")}renderGarden()}
function plantSelected(){let p=plots[selectedPlot];if(p){notify("Ô đất này đã có cây. Hãy chọn ô trống.");return}let s=seedTypes.find(x=>x.name===selectedSeed);if(seeds<s.cost){notify("Bạn chưa đủ hạt giống.");return}seeds-=s.cost;plots[selectedPlot]={plant:s.emoji,name:s.name.replace(/^\\S+ /,""),ready:false,protected:false,reward:s.reward};updateWallet();renderGarden();notify("Đã gieo hạt! Cây sẽ trưởng thành sau một thời gian (demo).");setTimeout(()=>{if(plots[selectedPlot]&&!plots[selectedPlot].ready){plots[selectedPlot].ready=true;renderGarden();notify("🌟 Cây của bạn đã trưởng thành!")}},8000)}
function harvest(i){let p=plots[i];if(!p||!p.ready){closeModal();return}let reward=p.reward||100;coins+=reward;plots[i]=null;closeModal();renderGarden();notify("Thu hoạch thành công! +"+reward+" xu 🪙")}
function buyShield(){if(coins<100){notify("Bạn không đủ xu để mua lá chắn.");return}coins-=100;shield++;updateWallet();notify("Đã mua 1 lá chắn bảo vệ khu vườn!")}
function protectPlot(i){if(!plots[i]){closeModal();return}if(plots[i].protected){notify("Cây này đã được bảo vệ.");return}if(shield<1){notify("Bạn chưa có lá chắn. Hãy mua ở mục Bảo vệ khu vườn.");return}shield--;plots[i].protected=true;updateWallet();renderGarden();closeModal();notify("Đã dùng lá chắn bảo vệ cây! 🛡️")}
function birthdayEvent(){let protectedPlots=plots.filter(p=>p&&p.protected).length;let vulnerable=plots.map((p,i)=>p&&!p.protected?i:-1).filter(i=>i>=0);let lost=0;if(vulnerable.length&&Math.random()<.9){let i=vulnerable[Math.floor(Math.random()*vulnerable.length)];plots[i]=null;lost=1}coins+=200;updateWallet();renderGarden();notify(lost?"🎂 Nhận quà +200 xu! Sự kiện làm mất 1 cây chưa bảo vệ.":"🎂 Chúc mừng sinh nhật! +200 xu. Khu vườn an toàn!")}
function showGardenHelp(){openModal(`<h2>🌱 Cách chơi Khu vườn tri thức</h2><ol><li>Hoàn thành nhiệm vụ học tập để nhận hạt giống.</li><li>Chọn loại cây và ô đất trống để gieo hạt.</li><li>Chờ cây phát triển rồi thu hoạch để nhận xu.</li><li>Dùng xu mua lá chắn và bảo vệ cây.</li><li>Tham gia sự kiện đặc biệt để nhận quà.</li></ol><div class="notice">Thời gian phát triển được rút ngắn trong bản demo để bạn dễ trình chiếu.</div>`)}
function openModal(content){document.getElementById("modalContent").innerHTML=content;document.getElementById("modalBackdrop").classList.add("show")}
function closeModal(){document.getElementById("modalBackdrop").classList.remove("show")}
function escapeHTML(s){return s.replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;"}[c]))}
initBooking();renderTutors();renderBookings();renderGroups();renderMarket();renderGarden();updateWallet();
</script>
</body>
</html>
'@

Set-Content -LiteralPath $file -Value $html -Encoding UTF8

Write-Host ""
Write-Host "Da tao website EduSmart thanh cong!" -ForegroundColor Green
Write-Host "Duong dan: $file" -ForegroundColor Cyan
Write-Host "Dang mo website tren trinh duyet..." -ForegroundColor Yellow

Start-Process $file
