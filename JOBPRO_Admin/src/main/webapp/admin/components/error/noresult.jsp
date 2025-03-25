<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isErrorPage="true" %>
<head>
    <title>Title</title>
</head>
<body>
<main class="grid min-h-full place-items-center bg-white px-6 py-24 sm:py-32 lg:px-8">
    <div class="text-center">
        <p class="text-base font-semibold text-indigo-600">No Result!</p>
        <h1 class="mt-4 text-5xl font-semibold tracking-tight text-balance text-gray-900 sm:text-7xl">
            검색 결과가 없습니다!
        </h1>
        <div class="mt-10 flex items-center justify-center gap-x-6">
            <button onclick="location.href = '/admin/${origin}.do';"
                    class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-xs hover:cursor-pointer hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Go Back
            </button>
        </div>
    </div>
</main>
</body>
