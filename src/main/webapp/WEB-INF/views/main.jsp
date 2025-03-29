<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>별명 자랑 페이지</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @font-face {
            font-family: 'Danjo-bold-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Danjo-bold-Regular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        * {
            font-family: 'Danjo-bold-Regular';
            font-size: 24px;
        }
        body {
            background-color: #121212;
            color: #ffffff;
        }
        .container {
            margin-top: 50px;
        }
        .form-label {
            color: #cccccc;
        }
        .form-control, .btn {
            border-radius: 10px;
        }
        .btn-primary {
            background-color: #1f6feb;
            border: none;
        }
        .btn-danger {
            background-color: #d32f2f;
            border: none;
        }
        .form-section {
            background-color: #1e1e1e;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.6);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4 text-center">🌟 별명 자랑 페이지 🌟</h1>

    <div class="form-section">
        <h5>현재 별명 목록</h5>
        <p><%= request.getAttribute("accounts") %></p>
    </div>

    <div class="form-section">
        <h5>별명 등록</h5>
        <form method="POST">
            <input type="hidden" name="id" value="0">
            <div class="mb-3">
                <label class="form-label">별명</label>
                <input type="text" name="nickname" class="form-control" placeholder="예: 슈퍼개발자">
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
        </form>
    </div>

    <div class="form-section">
        <h5>별명 삭제</h5>
        <form action="delete">
            <div class="mb-3">
                <label class="form-label">번호</label>
                <input type="text" name="id" class="form-control" placeholder="예: 3">
            </div>
            <button type="submit" class="btn btn-danger">삭제</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS (선택사항) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
