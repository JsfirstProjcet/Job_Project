<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Home</title>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts@3.46.0/dist/apexcharts.min.js"></script>
</head>
<body class="bg-sky-100/40">
<h2 class="flex justify-center w-auto text-3xl text-bold bg-white shadow-lg py-4 mx-32 rounded-lg">
    JOBPRO INSIGHT
</h2>
<div class="flex flex-row gap-8 justify-center middle mt-8 w-full h-full">
    <jsp:include page="home/users.jsp"/>
    <jsp:include page="home/companycategory.jsp"/>
    <jsp:include page="home/recruitratio.jsp"/>
</div>
<div class="flex mt-8 mx-32">
    <jsp:include page="home/table.jsp"/>
</div>
</body>
<script>
  setInterval(() => {
    location.reload();
  }, 20000)
</script>
