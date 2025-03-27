<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>연봉 계산기</title>
    <link rel="stylesheet" href="../shadow/css/shadowbox.css">

<!-- Favicon -->
<link href="../img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../lib/animate/animate.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../tcss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../tcss/style.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../main/header.jsp"/>

 <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
		
		
		
        <jsp:include page="${main_jsp }"/>
        <div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center mb-4">연봉 계산기</h2>
        <div class="input-group mb-3">
            <input type="number" id="salary" class="form-control" placeholder="당신의 월급을 입력하세요" aria-label="월급 입력" required>
            <button class="btn btn-primary" onclick="calculator()">계산하기</button>
        </div>
    </div>

    <div class="card shadow-lg p-4 mt-4" id="result" style="display: none;">
        <h2 class="text-center">연봉 계산 결과</h2>
        <p><strong>총 연봉:</strong> <span id="annualSalary"></span> 원</p>
        <h4>세금 내역</h4>
        <ul>
            <li>소득세: <span id="incomeTax"></span> 원</li>
            <li>지방소득세: <span id="localTax"></span> 원</li>
            <li>건강보험: <span id="healthInsurance"></span> 원</li>
            <li>국민연금: <span id="nationalPension"></span> 원</li>
            <li>고용보험: <span id="employmentInsurance"></span> 원</li>
            <li><strong>총 세금:</strong> <span id="totalTax"></span> 원</li>
        </ul>
        <p><strong>세금 공제 후 연봉:</strong> <span id="netSalary"></span> 원</p>
        <button class="btn btn-secondary" onclick="resetCalculator()">다시 계산하기</button>
    </div>
</div>

<script>
  function calculator() {
      let salary = document.getElementById('salary').value;
      if (!salary || salary <= 0) {
          alert("올바른 월급을 입력하세요.");
          return;
      }
      
      let monthlySalary = parseFloat(salary);
      let annualSalary = monthlySalary * 12;
      let incomeTax = annualSalary * 0.06;
      let healthInsurance = annualSalary * 0.035;
      let nationalPension = annualSalary * 0.045;
      let employmentInsurance = annualSalary * 0.009;
      let localTax = incomeTax * 0.1;
      let totalTax = incomeTax + healthInsurance + nationalPension + employmentInsurance + localTax;
      let netSalary = annualSalary - totalTax;

      document.getElementById('annualSalary').innerText = annualSalary.toLocaleString();
      document.getElementById('incomeTax').innerText = incomeTax.toLocaleString();
      document.getElementById('localTax').innerText = localTax.toLocaleString();
      document.getElementById('healthInsurance').innerText = healthInsurance.toLocaleString();
      document.getElementById('nationalPension').innerText = nationalPension.toLocaleString();
      document.getElementById('employmentInsurance').innerText = employmentInsurance.toLocaleString();
      document.getElementById('totalTax').innerText = totalTax.toLocaleString();
      document.getElementById('netSalary').innerText = netSalary.toLocaleString();
      
      document.getElementById('result').style.display = 'block';
  }
  
  function resetCalculator() {
      document.getElementById('salary').value = "";
      document.getElementById('result').style.display = 'none';
  }
</script>
        
        <jsp:include page="../main/footer.jsp"/>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>


</html>