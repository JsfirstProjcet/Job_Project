<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<jsp:include page="../../components/prefixPage.jsp"/>
<div id="detail"
     class="flex justify-center w-full h-full p-4 text-gray-700">
    <p class="text-left text-2xl text-gray-900 border-b border-gray-900">
        상세 보기
    </p>
</div>
<div class="flex justify-center col w-full h-full gap-4">
    <div class="flex grid justify-center">
        <div class="relative size-90 grid m-4 text-gray-700 bg-gray-300 bg-clip-border rounded-xl place-items-center">
            <c:if test="${top == 'user'}">
                <c:if test="${vo[0].poster}">
                    <img src="${vo[0].poster}" alt="ProfileImage"/>
                </c:if>
            </c:if>
            <c:if test="${!user}">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                     stroke-width="2" stroke="currentColor"
                     class="size-30 text-gray-500">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="m2.25 15.75 5.159-5.159a2.25 2.25 0 0 1 3.182 0l5.159 5.159m-1.5-1.5 1.409-1.409a2.25 2.25 0 0 1 3.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 0 0 1.5-1.5V6a1.5 1.5 0 0 0-1.5-1.5H3.75A1.5 1.5 0 0 0 2.25 6v12a1.5 1.5 0 0 0 1.5 1.5Zm10.5-11.25h.008v.008h-.008V8.25Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z">
                    </path>
                </svg>
            </c:if>
        </div>
    </div>
    <div class="flex justify-center vertical-middle m-4 p-4">
        <table class="table-auto h-12 border-collapse border border-gray-400 text-left vertical-middle p-2 rounded-lg">
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
</body>