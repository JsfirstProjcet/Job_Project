<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div class="flex justify-center flex-col w-full h-full gap-4">
    <jsp:include page="../../components/prefixPage.jsp"/>
    <div class="flex flex-row justify-center gap-4 mt-10">
        <div class="px-4 py-12 flex justify-center border-1 rounded-xl h-[84vh] w-[60%] overflow-auto">
            ${vo[0].content}
        </div>
        <div class="flex flex-col justify-start p-4">
            <table class="table-auto h-10 border-collapse border border-gray-400 text-left vertical-middle p-2 rounded-lg">
                <c:forEach items="${vo}" var="v">
                    <c:forEach items="${thead}" var="h">
                        <tr>
                            <td class="px-4 py-2 border border-gray-300 bg-gray-200">
                                <p class="text-md">
                                        ${h.value}
                                </p>
                            </td>
                            <td class="px-4 py-2 border border-gray-300">
                                <p class="text-md">
                                        ${v[h.key]}
                                </p>
                            </td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
<script>
  window.onload = () => {
    document.getElementById("spinner").classList.toggle('hidden');
  }
</script>