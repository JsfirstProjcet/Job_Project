<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
</head>
<body>
<div id="sidebar"
     class="h-screen max-h-screen w-1/6 max-w-70 flex flex-col bg-clip-border p-4 text-gray-700 shadow-xl shadow-blue-gray-900/5 duration-300">
    <button onclick="location.href = '/admin/main.do'"
            class="flex justify-start p-2 text-left hover:cursor-pointer">
        <h5 class="block whitespace-nowrap font-sans text-xl hover:font- duration-500 antialiased font-semibold leading-snug tracking-normal text-blue-gray-900">
            Admin Management
        </h5>
    </button>
    <nav class="flex max-w-[15vw] min-w-[230px] flex-col gap-1 p-2 font-sans text-base font-normal text-blue-gray-700 hover:cursor-pointer">
        <div role="button" id="main.do"
             onclick="location.href = '/admin/main.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path d="M11.47 3.841a.75.75 0 0 1 1.06 0l8.69 8.69a.75.75 0 1 0 1.06-1.061l-8.689-8.69a2.25 2.25 0 0 0-3.182 0l-8.69 8.69a.75.75 0 1 0 1.061 1.06l8.69-8.689Z"/>
                    <path d="m12 5.432 8.159 8.159c.03.03.06.058.091.086v6.198c0 1.035-.84 1.875-1.875 1.875H15a.75.75 0 0 1-.75-.75v-4.5a.75.75 0 0 0-.75-.75h-3a.75.75 0 0 0-.75.75V21a.75.75 0 0 1-.75.75H5.625a1.875 1.875 0 0 1-1.875-1.875v-6.198a2.29 2.29 0 0 0 .091-.086L12 5.432Z"/>
                </svg>
            </div>
            Main
        </div>
        <div role="button" id="user.do"
             onclick="location.href = '/admin/user.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400  hover:cursor-pointer">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M18.685 19.097A9.723 9.723 0 0 0 21.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 0 0 3.065 7.097A9.716 9.716 0 0 0 12 21.75a9.716 9.716 0 0 0 6.685-2.653Zm-12.54-1.285A7.486 7.486 0 0 1 12 15a7.486 7.486 0 0 1 5.855 2.812A8.224 8.224 0 0 1 12 20.25a8.224 8.224 0 0 1-5.855-2.438ZM15.75 9a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z"
                          clip-rule="evenodd"/>
                </svg>
            </div>
            Users
        </div>
        <div class="relative block w-full">
            <div role="button"
                 class="flex items-center w-full p-0 leading-tight transition-all rounded-lg outline-none hover:cursor-pointer">
                <button type="button" id="dropdown-management-button"
                        class="flex items-center justify-between w-full p-3 font-sans text-xl antialiased font-semibold leading-snug text-left transition-colors border-b-0 select-none border-b-blue-gray-100 hover:cursor-pointer hover:bg-blue-200 rounded-lg"
                        onClick="document.getElementById('dropdown-management-content').classList.toggle('hidden'); document.getElementById('arrow-first').classList.toggle('rotate-180')">
                    <div class="grid mr-4 place-items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                             fill="currentColor" class="size-5">
                            <path fill-rule="evenodd"
                                  d="M7.5 5.25a3 3 0 0 1 3-3h3a3 3 0 0 1 3 3v.205c.933.085 1.857.197 2.774.334 1.454.218 2.476 1.483 2.476 2.917v3.033c0 1.211-.734 2.352-1.936 2.752A24.726 24.726 0 0 1 12 15.75c-2.73 0-5.357-.442-7.814-1.259-1.202-.4-1.936-1.541-1.936-2.752V8.706c0-1.434 1.022-2.7 2.476-2.917A48.814 48.814 0 0 1 7.5 5.455V5.25Zm7.5 0v.09a49.488 49.488 0 0 0-6 0v-.09a1.5 1.5 0 0 1 1.5-1.5h3a1.5 1.5 0 0 1 1.5 1.5Zm-3 8.25a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z"
                                  clip-rule="evenodd"/>
                            <path d="M3 18.4v-2.796a4.3 4.3 0 0 0 .713.31A26.226 26.226 0 0 0 12 17.25c2.892 0 5.68-.468 8.287-1.335.252-.084.49-.189.713-.311V18.4c0 1.452-1.047 2.728-2.523 2.923-2.12.282-4.282.427-6.477.427a49.19 49.19 0 0 1-6.477-.427C4.047 21.128 3 19.852 3 18.4Z"/>
                        </svg>
                    </div>
                    <p class="block mr-auto font-sans text-base antialiased font-normal leading-relaxed text-blue-gray-900">
                        Company
                    </p>
                    <span class="ml-4">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
                             fill="currentColor"
                             id="arrow-first" class="size-5">
                            <path fill-rule="evenodd"
                                  d="M12.53 16.28a.75.75 0 0 1-1.06 0l-7.5-7.5a.75.75 0 0 1 1.06-1.06L12 14.69l6.97-6.97a.75.75 0 1 1 1.06 1.06l-7.5 7.5Z"
                                  clip-rule="evenodd"/>
                        </svg>
                    </span>
                </button>
            </div>
            <div class="hidden overflow-hidden"
                 id="dropdown-management-content">
                <div class="block w-full py-1 font-sans text-sm antialiased font-light leading-normal text-gray-700">
                    <nav class="flex min-w-[200px] flex-col gap-1 p-0 font-sans text-base font-normal text-blue-gray-700">
                        <div role="button" id="company.do"
                             onclick="location.href = '/admin/company.do'; document.getElementById('spinner').classList.toggle('hidden');"
                             class="flex items-center w-full max-w-inherit p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400  hover:cursor-pointer">
                            <div class="grid mr-4 place-items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 24 24" stroke-width="3"
                                     stroke="currentColor" aria-hidden="true" class="w-5 h-3">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M8.25 4.5l7.5 7.5-7.5 7.5"></path>
                                </svg>
                            </div>
                            Account
                        </div>
                        <div role="button" id="auth.do"
                             onclick="location.href = '/admin/auth.do'; document.getElementById('spinner').classList.toggle('hidden');"
                             class="flex items-center w-full max-w-inherit p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400 hover:cursor-pointer">
                            <div class="grid mr-4 place-items-center">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none"
                                     viewBox="0 0 24 24" stroke-width="3"
                                     stroke="currentColor" aria-hidden="true" class="w-5 h-3">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                          d="M8.25 4.5l7.5 7.5-7.5 7.5"></path>
                                </svg>
                            </div>
                            Auth
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <hr class="w-full my-2 border-blue-gray-50"/>
        <div role="button" id="recruit.do"
             onclick="location.href = '/admin/recruit.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400 hover:cursor-pointer">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M7.502 6h7.128A3.375 3.375 0 0 1 18 9.375v9.375a3 3 0 0 0 3-3V6.108c0-1.505-1.125-2.811-2.664-2.94a48.972 48.972 0 0 0-.673-.05A3 3 0 0 0 15 1.5h-1.5a3 3 0 0 0-2.663 1.618c-.225.015-.45.032-.673.05C8.662 3.295 7.554 4.542 7.502 6ZM13.5 3A1.5 1.5 0 0 0 12 4.5h4.5A1.5 1.5 0 0 0 15 3h-1.5Z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M3 9.375C3 8.339 3.84 7.5 4.875 7.5h9.75c1.036 0 1.875.84 1.875 1.875v11.25c0 1.035-.84 1.875-1.875 1.875h-9.75A1.875 1.875 0 0 1 3 20.625V9.375ZM6 12a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V12Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75ZM6 15a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V15Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75ZM6 18a.75.75 0 0 1 .75-.75h.008a.75.75 0 0 1 .75.75v.008a.75.75 0 0 1-.75.75H6.75a.75.75 0 0 1-.75-.75V18Zm2.25 0a.75.75 0 0 1 .75-.75h3.75a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75Z"
                          clip-rule="evenodd"/>
                </svg>
            </div>
            Recruit
        </div>
        <div role="button" id="community.do"
             onclick="location.href = '/admin/community.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400 hover:cursor-pointer">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path d="M4.5 6.375a4.125 4.125 0 1 1 8.25 0 4.125 4.125 0 0 1-8.25 0ZM14.25 8.625a3.375 3.375 0 1 1 6.75 0 3.375 3.375 0 0 1-6.75 0ZM1.5 19.125a7.125 7.125 0 0 1 14.25 0v.003l-.001.119a.75.75 0 0 1-.363.63 13.067 13.067 0 0 1-6.761 1.873c-2.472 0-4.786-.684-6.76-1.873a.75.75 0 0 1-.364-.63l-.001-.122ZM17.25 19.128l-.001.144a2.25 2.25 0 0 1-.233.96 10.088 10.088 0 0 0 5.06-1.01.75.75 0 0 0 .42-.643 4.875 4.875 0 0 0-6.957-4.611 8.586 8.586 0 0 1 1.71 5.157v.003Z"/>
                </svg>
            </div>
            Community
        </div>
        <div role="button" id="service.do"
             onclick="location.href = '/admin/service.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm11.378-3.917c-.89-.777-2.366-.777-3.255 0a.75.75 0 0 1-.988-1.129c1.454-1.272 3.776-1.272 5.23 0 1.513 1.324 1.513 3.518 0 4.842a3.75 3.75 0 0 1-.837.552c-.676.328-1.028.774-1.028 1.152v.75a.75.75 0 0 1-1.5 0v-.75c0-1.279 1.06-2.107 1.875-2.502.182-.088.351-.199.503-.331.83-.727.83-1.857 0-2.584ZM12 18a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z"
                          clip-rule="evenodd"/>
                </svg>
            </div>
            QnA
        </div>
        <div role="button" id="logout"
             onclick="location.href = '/admin/main.do'; document.getElementById('spinner').classList.toggle('hidden');"
             class="flex items-center w-full p-3 leading-tight transition-all rounded-lg outline-none text-start hover:bg-blue-200 focus:bg-blue-400 hover:cursor-pointer">
            <div class="grid mr-4 place-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                     class="size-5">
                    <path fill-rule="evenodd"
                          d="M16.5 3.75a1.5 1.5 0 0 1 1.5 1.5v13.5a1.5 1.5 0 0 1-1.5 1.5h-6a1.5 1.5 0 0 1-1.5-1.5V15a.75.75 0 0 0-1.5 0v3.75a3 3 0 0 0 3 3h6a3 3 0 0 0 3-3V5.25a3 3 0 0 0-3-3h-6a3 3 0 0 0-3 3V9A.75.75 0 1 0 9 9V5.25a1.5 1.5 0 0 1 1.5-1.5h6ZM5.78 8.47a.75.75 0 0 0-1.06 0l-3 3a.75.75 0 0 0 0 1.06l3 3a.75.75 0 0 0 1.06-1.06l-1.72-1.72H15a.75.75 0 0 0 0-1.5H4.06l1.72-1.72a.75.75 0 0 0 0-1.06Z"
                          clip-rule="evenodd"/>
                </svg>
            </div>
            Log Out
        </div>
    </nav>
</div>
</body>
<script>
  const comDropdown = document.getElementById('dropdown-management-content');
  const used = document.getElementById("${path}")

  if (used.id.includes("${path}")) {
    used.classList.toggle('bg-slate-200');

    if (used.id == "company.do" || used.id == "auth.do") {
      comDropdown.classList.remove('hidden')
      comDropdown.classList.toggle('visible')
    }
  }
</script>