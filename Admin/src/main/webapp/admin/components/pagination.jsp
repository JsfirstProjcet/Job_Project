<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <title></title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div class="flex justify-center">
    <nav class="inline-flex space-x-2">
        <c:if test="${start > 1}">
            <button onclick="location.href = '${path}?page=${start - 1}'"
                    class="min-w-9 rounded-md border border-slate-300 py-2 px-3 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer">
                Prev
            </button>
        </c:if>
        <c:forEach var="i" begin="${start}" end="${end}">
            <button onclick="location.href = '${path}?page=${i}'" id="${i}"
                    class="min-w-9 rounded-md border border-slate-300 py-2 px-3 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer ${i == cur ? 'bg-slate-600 text-white' : ''}">
                    ${i}
            </button>
        </c:forEach>
        <c:if test="${end < total}">
            <button onclick="location.href = '${path}?page=${end + 1}'"
                    class="min-w-9 rounded-md border border-slate-300 py-2 px-3 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer">
                Next
            </button>
        </c:if>
    </nav>
</div>
</body>
<script>
  const currentBtn = document.getElementById("${cur}");
  if (currentBtn) {
    currentBtn.classList.add('bg-slate-600', 'text-white');
  }
</script>