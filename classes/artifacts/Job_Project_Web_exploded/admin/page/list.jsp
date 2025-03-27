<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div class="flex-shrink-0 ml-auto my-2">
    <jsp:include page="../components/search.jsp"/>
</div>
<div class="relative flex flex-col w-full max-w-full h-full text-gray-700 my-4">
    <table class="w-full text-left table-auto min-w-max shadow-lg bg-white">
        <thead class="${color}">
        <tr>
            <c:forEach items="${thead}" var="th">
                <c:choose>
                    <c:when test="${th.key.contains('Detail') || th.key == 'delete' || th.key == 'allow'}">
                        <th class="w-4 p-2 border-b border-blue-gray-100">
                            <p class="block text-blue-gray-900">&nbsp;</p>
                        </th>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${th.value == 'No' || th.value == 'ID'}">
                                <th class="max-w-2 p-2 border-b border-blue-gray-100">
                            </c:when>
                            <c:otherwise>
                                <th class="max-w-20 px-4 py-2 border-b border-blue-gray-100">
                            </c:otherwise>
                        </c:choose>
                        <p class="block text-blue-gray-900">${th.value}</p>
                        </th>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vo}" var="tb" varStatus="status">
            <tr>
                <c:forEach items="${thead}" var="th">
                    <c:choose>
                        <c:when test="${th.key == 'no'}">
                            <td class="max-w-8 px-4 py-2 border-b border-blue-gray-50">
                                <p class="block text-sm antialiased font-normal leading-normal text-blue-gray-900">
                                        ${(status.count + ((cur - 1) * 15))}
                                </p>
                            </td>
                        </c:when>
                        <c:when test="${!th.key.contains('Detail') && th.key != 'delete' && th.key != 'allow' && th.value != 'Date'}">
                            <td class="px-4 py-2 border-b border-blue-gray-50">
                                <p class="block text-sm antialiased font-normal leading-normal text-blue-gray-900 overflow-hidden text-ellipsis">
                                        ${tb[th.key]}
                                </p>
                            </td>
                        </c:when>
                        <c:when test="${th.value == 'Date'}">
                            <td class="px-4 py-2 border-b border-blue-gray-50">
                                <p class="block text-sm antialiased font-normal leading-normal text-blue-gray-900 overflow-hidden text-ellipsis">
                                    <fmt:formatDate value="${tb[th.key]}"
                                                    pattern="yyyy-MM-dd a HH:mm"/>
                                </p>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'allow'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button id="allowButton"
                                        onclick="allowAction('${detail[status.index]}'); document.getElementById('spinner').classList.toggle('hidden');"
                                        class="w-full h-full hover:cursor-pointer text-blue-gray-300 hover:text-blue-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-5 text-green-400">
                                        <path fill-rule="evenodd"
                                              d="M19.916 4.626a.75.75 0 0 1 .208 1.04l-9 13.5a.75.75 0 0 1-1.154.114l-6-6a.75.75 0 0 1 1.06-1.06l5.353 5.353 8.493-12.74a.75.75 0 0 1 1.04-.207Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'accountDetail'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button onclick="location.href = '/admin/${origin}/accountDetail.do?pre=${path}&page=${cur}&id=${detail[status.index]}';"
                                        class="w-full h-full hover:cursor-pointer text-blue-gray-300 hover:text-blue-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-5">
                                        <path fill-rule="evenodd"
                                              d="M18.685 19.097A9.723 9.723 0 0 0 21.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 0 0 3.065 7.097A9.716 9.716 0 0 0 12 21.75a9.716 9.716 0 0 0 6.685-2.653Zm-12.54-1.285A7.486 7.486 0 0 1 12 15a7.486 7.486 0 0 1 5.855 2.812A8.224 8.224 0 0 1 12 20.25a8.224 8.224 0 0 1-5.855-2.438ZM15.75 9a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'boardDetail'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button onclick="location.href = '/admin/${origin}/boardDetail.do?pre=${path}&page=${cur}&id=${detail[status.index]}';"
                                        class="w-full h-full hover:cursor-pointer text-blue-gray-300 hover:text-blue-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-5">
                                        <path fill-rule="evenodd"
                                              d="M7.502 6h7.128A3.375 3.375 0 0 1 18 9.375v9.375a3 3 0 0 0 3-3V6.108c0-1.505-1.125-2.811-2.664-2.94a48.972 48.972 0 0 0-.673-.05A3 3 0 0 0 15 1.5h-1.5a3 3 0 0 0-2.663 1.618c-.225.015-.45.032-.673.05C8.662 3.295 7.554 4.542 7.502 6ZM13.5 3A1.5 1.5 0 0 0 12 4.5h4.5A1.5 1.5 0 0 0 15 3h-1.5Z"
                                              clip-rule="evenodd"/>
                                        <path fill-rule="evenodd"
                                              d="M3 9.375C3 8.339 3.84 7.5 4.875 7.5h9.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625V9.375ZM6 12a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V12Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75ZM6 15a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V15Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75ZM6 18a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V18Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'recruitDetail'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button onclick="location.href = '/admin/${origin}/recruitDetail.do?pre=${path}&page=${cur}&id=${detail[status.index]}';"
                                        class="w-full h-full hover:cursor-pointer text-blue-gray-300 hover:text-blue-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-5">
                                        <path fill-rule="evenodd"
                                              d="M10.5 3A1.501 1.501 0 0 0 9 4.5h6A1.5 1.5 0 0 0 13.5 3h-3Zm-2.693.178A3 3 0 0 1 10.5 1.5h3a3 3 0 0 1 2.694 1.678c.497.042.992.092 1.486.15 1.497.173 2.57 1.46 2.57 2.929V19.5a3 3 0 0 1-3 3H6.75a3 3 0 0 1-3-3V6.257c0-1.47 1.073-2.756 2.57-2.93.493-.057.989-.107 1.487-.15Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'serviceDetail'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button onclick="location.href = '/admin/${origin}/serviceDetail.do?pre=${path}&page=${cur}&id=${detail[status.index]}';"
                                        class="w-full h-full hover:cursor-pointer text-blue-gray-300 hover:text-blue-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor" class="size-5">
                                        <path fill-rule="evenodd"
                                              d="M4.848 2.771A49.144 49.144 0 0 1 12 2.25c2.43 0 4.817.178 7.152.52 1.978.292 3.348 2.024 3.348 3.97v6.02c0 1.946-1.37 3.678-3.348 3.97a48.901 48.901 0 0 1-3.476.383.39.39 0 0 0-.297.17l-2.755 4.133a.75.75 0 0 1-1.248 0l-2.755-4.133a.39.39 0 0 0-.297-.17 48.9 48.9 0 0 1-3.476-.384c-1.978-.29-3.348-2.024-3.348-3.97V6.741c0-1.946 1.37-3.68 3.348-3.97ZM6.75 8.25a.75.75 0 0 1 .75-.75h9a.75.75 0 0 1 0 1.5h-9a.75.75 0 0 1-.75-.75Zm.75 2.25a.75.75 0 0 0 0 1.5H12a.75.75 0 0 0 0-1.5H7.5Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                        <c:when test="${th.key == 'delete'}">
                            <td class="p-2 rounded-lg border-b border-blue-gray-50">
                                <button id="deleteButton"
                                        onclick="deleteAction('${detail[status.index]}')"
                                        class="w-full h-full hover:cursor-pointer text-red-700 hover:text-red-500 hover:bg-gray-200 rounded-xl">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                                         fill="currentColor"
                                         class="size-5">
                                        <path fill-rule="evenodd"
                                              d="M16.5 4.478v.227a48.816 48.816 0 0 1 3.878.512.75.75 0 1 1-.256 1.478l-.209-.035-1.005 13.07a3 3 0 0 1-2.991 2.77H8.084a3 3 0 0 1-2.991-2.77L4.087 6.66l-.209.035a.75.75 0 0 1-.256-1.478A48.567 48.567 0 0 1 7.5 4.705v-.227c0-1.564 1.213-2.9 2.816-2.951a52.662 52.662 0 0 1 3.369 0c1.603.051 2.815 1.387 2.815 2.951Zm-6.136-1.452a51.196 51.196 0 0 1 3.273 0C14.39 3.05 15 3.684 15 4.478v.113a49.488 49.488 0 0 0-6 0v-.113c0-.794.609-1.428 1.364-1.452Zm-.355 5.945a.75.75 0 1 0-1.5.058l.347 9a.75.75 0 1 0 1.499-.058l-.346-9Zm5.48.058a.75.75 0 1 0-1.498-.058l-.347 9a.75.75 0 0 0 1.5.058l.345-9Z"
                                              clip-rule="evenodd"/>
                                    </svg>
                                </button>
                            </td>
                        </c:when>
                    </c:choose>
                </c:forEach>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="flex justify-center w-full">
    <jsp:include page="../components/pagination.jsp"/>
</div>
<script>
  const allowAction = (id) => {
    if (confirm("정말 승인하시겠습니까?")) {
      alert("승인되었습니다!")
      fetch('/admin/${origin}/allow.do?pre=${path}&page=${cur}&id=' + id, {
        method: 'GET',
      })
      setInterval(() => {
        location.href = '/admin/${origin}.do'
      }, 2000)
    } else {
      location.href = '/admin/${origin}.do?page=${cur}'
    }
  }
  const deleteAction = (id) => {
    if (confirm("정말 삭제하시겠습니까?")) {
      alert("삭제되었습니다!")
      document.getElementById('spinner').classList.toggle('hidden');
      fetch('/admin/${origin}/delete.do?pre=${path}&page=${cur}&id=' + id, {
        method: 'GET',
      })
      setInterval(() => {
        document.getElementById('spinner').classList.toggle('hidden');
        location.href = '/admin/${origin}.do'
      }, 2000)
    } else {
      location.href = '/admin/${origin}.do?page=${cur}'
    }
  }
</script>
</body>
