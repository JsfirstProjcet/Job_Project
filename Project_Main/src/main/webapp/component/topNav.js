import {pageUrl, url} from "../constants/dirname.js";

if (url.searchParams.get('page') == null) {
  window.location.replace(url.origin + url.pathname + "?page=1")
}

const topNav = document.getElementById("top-nav");
topNav.insertAdjacentHTML("beforebegin", `
<div class="mx-auto max-w-full bg-gray-600">
    <div class="mx-auto relative flex h-16 items-center justify-between max-w-7xl px-2 sm:px-6 lg:px-8 ">
      <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
        <div class="flex shrink-0 items-center">
          <a href="${pageUrl}index.html">
            <img class="h-8 w-auto"
                 src="https://i.namu.wiki/i/-4hK6ewvrlVY6zrmy1c4lUgNGu-s8xTSpb4os6jqjSAQYyyfd2UuhTH_9i8X8YeKtPEZgyXY_7nE4rIjgfOGGaO6hy9fmOXDzmuzJb_Z_ZHfD1xFO6HL6H_-kzOmbeWba1pqcRYH0Kbz7TAET9A6qw.svg"
                 alt="Your Company">
          </a>
        </div>
        <div class="hidden sm:ml-6 sm:block">
          <div id="nav" class="flex space-x-4">
          </div>
        </div>
      </div>
      <div class="w-full max-w-sm min-w-[200px]">
        <div class="relative">
          <label>
            <input
              class="w-full bg-transparent placeholder:text-slate-400 text-slate-700 text-sm border border-slate-200 rounded-md pl-3 pr-28 py-2 transition duration-300 ease focus:outline-none focus:border-slate-400 hover:border-slate-300 shadow-sm focus:shadow focus:bg-white"
              placeholder=""
            />
          </label>
          <button
            class="absolute top-1 right-1 items-center rounded bg-slate-600 py-1.5 px-2 border border-transparent text-center text-sm text-white transition-all shadow-sm focus:shadow-none active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none bg-none bg-inherit"
            type="button"
          >
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                 class="size-4">
              <path fill-rule="evenodd"
                    d="M10.5 3.75a6.75 6.75 0 1 0 0 13.5 6.75 6.75 0 0 0 0-13.5ZM2.25 10.5a8.25 8.25 0 1 1 14.59 5.28l4.69 4.69a.75.75 0 1 1-1.06 1.06l-4.69-4.69A8.25 8.25 0 0 1 2.25 10.5Z"
                    clip-rule="evenodd"/>
            </svg>
          </button>
        </div>
      </div>
      <div
        class="relative inline-block inset-y-0 right-0 items-center sm:static sm:inset-auto sm:ml-6 sm:pr-0">
        <!--알람 dropdown-->
        <button id="noti-dropdown-button" type="button"
                class="relative rounded-full bg-gray-600 text-gray-400 hover:text-white focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-600 focus:outline-hidden hover:cursor-pointer">
          <span class="sr-only">noti</span>
          <svg class="size-7 object-cover object-center inline-block" fill="none"
               viewBox="0 0 24 24"
               stroke-width="1.5"
               stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9A6 6 0 0 0 6 9v.75a8.967 8.967 0 0 1-2.312 6.022c1.733.64 3.56 1.085 5.455 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0"/>
          </svg>
        </button>
        <div id="noti-dropdown-content"
             class="absolute right-0 z-10 mt-2 w-100 origin-top-right rounded-md bg-white ring-1 shadow-lg ring-black/5 focus:outline-hidden hidden">
          <ul id="noti-list" role="menu" class="py-2 text-sm text-gray-700 dark:text-gray-200">
          </ul>
        </div>

        <!-- 프로필 dropdown -->
        <div id="profile-container"
             class="relative inline-block text-left mx-2 cursor-pointer">
        </div>
      </div>
    </div>
  </div>
`)

const nav = document.getElementById("nav");

const navData = [
  "채용정보",
  "기업정보",
  "커뮤니티",
  "자료실"
];
navData.forEach((d, index) => {

  if (url.searchParams.get('page') === (index + 1).toString()) {
    nav.insertAdjacentHTML("beforeend", `
      <a href="#" 
        class="rounded-md bg-gray-900 px-3 py-2 text-sm font-medium text-white">
        ${d}
      </a>
    `)
  } else {
    nav.insertAdjacentHTML("beforeend", `
      <a href="index.html?page=${index + 1}"
        class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white">
        ${d}
      </a>
    `)
  }
})

/*
<a href="#" aria-current="page"
               class="rounded-md bg-gray-900 px-3 py-2 text-sm font-medium text-white">채용정보</a>
            <a href="#"
               class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white">기업정보</a>
            <a href="#"
               class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white">커뮤니티</a>
            <a href="#"
               class="rounded-md px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-700 hover:text-white">자료실</a>
 */
