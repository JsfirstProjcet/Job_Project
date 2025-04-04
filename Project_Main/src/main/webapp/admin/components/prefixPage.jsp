<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div class="relative flex flex-row align-middle justify-between w-full my-4">
    <button onclick="history.back()"
            class="absolute place-items-center size-16 top-0 left-0 rounded-xl focus:bg-gray-200 hover:cursor-pointer text-center">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
             class="size-6 text-bold">
            <path fill-rule="evenodd"
                  d="M9.53 2.47a.75.75 0 0 1 0 1.06L4.81 8.25H15a6.75 6.75 0 0 1 0 13.5h-3a.75.75 0 0 1 0-1.5h3a5.25 5.25 0 1 0 0-10.5H4.81l4.72 4.72a.75.75 0 1 1-1.06 1.06l-6-6a.75.75 0 0 1 0-1.06l6-6a.75.75 0 0 1 1.06 0Z"
                  clip-rule="evenodd"/>
        </svg>
    </button>
    <button id="deleteButton"
            onclick="deleteAction('${id}')"
            class="absolute place-items-center size-16 top-0 right-0 rounded-xl focus:bg-gray-200 hover:cursor-pointer text-center">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
             class="size-6 text-red-600">
            <path fill-rule="evenodd"
                  d="M16.5 4.478v.227a48.816 48.816 0 0 1 3.878.512.75.75 0 1 1-.256 1.478l-.209-.035-1.005 13.07a3 3 0 0 1-2.991 2.77H8.084a3 3 0 0 1-2.991-2.77L4.087 6.66l-.209.035a.75.75 0 0 1-.256-1.478A48.567 48.567 0 0 1 7.5 4.705v-.227c0-1.564 1.213-2.9 2.816-2.951a52.662 52.662 0 0 1 3.369 0c1.603.051 2.815 1.387 2.815 2.951Zm-6.136-1.452a51.196 51.196 0 0 1 3.273 0C14.39 3.05 15 3.684 15 4.478v.113a49.488 49.488 0 0 0-6 0v-.113c0-.794.609-1.428 1.364-1.452Zm-.355 5.945a.75.75 0 1 0-1.5.058l.347 9a.75.75 0 1 0 1.499-.058l-.346-9Zm5.48.058a.75.75 0 1 0-1.498-.058l-.347 9a.75.75 0 0 0 1.5.058l.345-9Z"
                  clip-rule="evenodd"/>
        </svg>
    </button>
</div>
</body>
<script>
  const deleteAction = (id) => {
    if (confirm("정말 삭제하시겠습니까?")) {
      alert("삭제되었습니다!")
      document.getElementById('spinner').classList.toggle('hidden');
      fetch('/Project_Main/admin/${origin}/delete.do?pre=${pre}&page=${page}&id=' + id, {
        method: 'GET',
      })
      setInterval(() => {
        document.getElementById('spinner').classList.toggle('hidden');
        location.href = '/Project_Main/admin/${origin}.do'
      }, 2000)
    } else {
      location.href = '/Project_Main/admin/${origin}.do?page=${page}'
    }
  }
</script>
