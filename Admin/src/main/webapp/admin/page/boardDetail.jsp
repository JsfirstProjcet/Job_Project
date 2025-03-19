<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<jsp:include page="../components/prefixPage.jsp"/>
<div class="flex justify-center mt-12 w-full h-full">
    <c:forEach items="${vo}" var="v">
        <div class="m-4 p-4 gap-4 w-full h-full text-left border-1 border-gray-900 rounded-xl">
            <p class="p-4 text-2xl">
                    ${v.subject}
            </p>
            <hr class="m-2 border-1 border-gray-900"/>
            <div class="flex justify-between p-4">
                <div class="flex flex-col gap-2">
                    <p>No: ${v.bno}</p>
                    <p>Nickname: ${v.nickname}</p>
                </div>
                <div class="flex flex-col gap-2">
                    <p>Type: ${v.type} | Hit: ${v.hit} | Reply: ${v.reply} | Like: ${v.likes}</p>
                    <p>Date: ${v.regdate}</p>
                </div>
            </div>
            <br class="m-2 border-1 border-gray-900"/>
            <p class="text-md p-4">
                    ${v.content}
            </p>
        </div>
    </c:forEach>
</div>
</body>
