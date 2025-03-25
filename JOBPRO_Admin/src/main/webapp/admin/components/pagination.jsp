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
                    class="min-w-9 rounded-md border border-slate-300 p-2 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M7.72 12.53a.75.75 0 0 1 0-1.06l7.5-7.5a.75.75 0 1 1 1.06 1.06L9.31 12l6.97 6.97a.75.75 0 1 1-1.06 1.06l-7.5-7.5Z"
                          clip-rule="evenodd"/>
                </svg>
            </button>
        </c:if>
        <c:forEach var="i" begin="${start}" end="${end}">
            <button onclick="paging('${path}', '${query}', ${i})"
                    id="${i}"
                    class="min-w-9 rounded-md border border-slate-300 py-2 px-3 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer ${i == cur ? 'bg-slate-600 text-white' : ''}">
                    ${i}
            </button>
        </c:forEach>
        <c:if test="${end < total}">
            <button onclick="paging('${path}', '${query}', ${i+1})"
                    class="min-w-9 rounded-md border border-slate-300 p-2 text-center text-sm transition-all shadow-sm hover:shadow-lg text-slate-600 hover:text-white hover:bg-slate-800 hover:border-slate-800 focus:text-white focus:bg-slate-800 focus:border-slate-800 active:border-slate-800 active:text-white active:bg-slate-800 disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none hover:cursor-pointer">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M16.28 11.47a.75.75 0 0 1 0 1.06l-7.5 7.5a.75.75 0 0 1-1.06-1.06L14.69 12 7.72 5.03a.75.75 0 0 1 1.06-1.06l7.5 7.5Z"
                          clip-rule="evenodd"/>
                </svg>
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
  const paging = (path, query, i) => {
    let url = path + "?page=" + i
    if (query) {
      url += "&query=" + query
    }
    location.href = url
  }
</script>