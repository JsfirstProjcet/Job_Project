<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<head>
    <title>Title</title>
</head>
<body>
<main class="grid min-h-full place-items-center bg-white px-6 py-24 sm:py-32 lg:px-8">
    <div class="text-center">
        <p class="text-base font-semibold text-indigo-600">404</p>
        <h1 class="mt-4 text-5xl font-semibold tracking-tight text-balance text-gray-900 sm:text-7xl">
            Page not found</h1>
        <p class="mt-6 text-lg font-medium text-pretty text-gray-500 sm:text-xl/8">Sorry, we
            couldn’t find the page you’re looking for.</p>
        <div class="mt-10 flex items-center justify-center gap-x-6">
            <button onclick="window.location.href = 'main.do';"
                    class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                Go Back 'Main'
            </button>
        </div>
        <div class="text-left">
            <br>
            <p class="text-md text-bold">
                Error!
            </p>
            <p class="text-sm">
                <%= "Class: " + exception.getClass().getName() %>
            </p>
            <p class="text-sm">
                <%= "Massage: " + exception.getMessage() %>
            </p>
        </div>
    </div>
</main>
<%
    System.out.println("Error!");
    System.out.println("Class: " + exception.getClass().getName());
    System.out.println("Massage: " + exception.getMessage());
%>
</body>