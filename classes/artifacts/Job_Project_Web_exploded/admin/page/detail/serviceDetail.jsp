<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<jsp:include page="../../components/prefixPage.jsp"/>
<div class="flex flex-row mt-12 justify-center w-full h-full py-4 px-12 gap-2">
    <div class="w-full h-full border-1 border-gray-900 rounded-xl p-4">
        <p class="px-4 py-2 text-left text-2xl text-bold">
            ${vo.qtitle}
        </p>
        <hr class="m-2 border-1 border-gray-900"/>
        <div class="flex flex-row px-4 py-2 justify-between">
            <div class="flex flex-col">
                <p class="text-left text-md">
                    ID: ${vo.id}
                </p>
                <p class="text-left text-md">
                    PID: ${vo.pid}
                </p>
            </div>
            <div class="flex flex-col">
                <p class="text-left text-md">
                    <fmt:formatDate value="${vo.qdate}"
                                    pattern="yyyy-MM-dd a HH:mm"/>
                </p>
                <p class="text-left text-md">
                    Secret: ${vo.visible == 1 ? "Y" : "N"}
                </p>
            </div>
        </div>
        <p class="px-4 py-2 text-left text-md text-bold">
            ${vo.qcontent}
        </p>
    </div>
    <c:if test="${vo.ok == 1}">
        <div class="w-full h-full border-1 border-gray-900 rounded-xl p-4">
            <p class="px-4 py-2 text-left text-2xl text-bold">
                    ${vo.atitle}
            </p>
            <hr class="mx-4 my-2 border-1 border-gray-900"/>
            <div class="flex flex-row px-4 py-2 justify-between">
                <p class="text-left text-md">
                    <fmt:formatDate value="${vo.adate}"
                                    pattern="yyyy-MM-dd a HH:mm"/>
                </p>
            </div>
            <p class="px-4 py-2 text-left text-md text-bold">
                    ${vo.acontent}
            </p>
        </div>
    </c:if>
    <c:if test="${vo.ok == 0}">
        <div class="w-full h-full border-1 border-gray-900 rounded-xl py-4 px-6">
            <form name="form" action="${submit}?pre=${pre}&page=${page}&id=${id}" method="post">
                <input type="text" name="title" placeholder="제목을 입력하세요."
                       class="w-full border-b border-gray-900 focus:border-b-2 focus:outline-none text-2xl p-2"/>
                <textarea required name="content" placeholder="내용을 입력하세요." rows="20" cols="50"
                          class="w-full h-full p-2 focus:outline-none"></textarea>
                <input type="submit"
                       placeholder="Submit"
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800 hover:cursor-pointer"/>
            </form>
        </div>
    </c:if>
</div>
</body>