const notification = document.getElementById("noti-list");
const notiData = [
  {
    image: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80",
    name: "jack",
    msg: "hello world",
    time: new Date().getMinutes() + "분 " + new Date().getSeconds() + "초 전"
  }, {
    image: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80",
    name: "jack",
    msg: "hello world",
    time: new Date().getMinutes() + "분 " + new Date().getSeconds() + "초 전"
  }, {
    image: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80",
    name: "jack",
    msg: "hello world",
    time: new Date().getMinutes() + "분 " + new Date().getSeconds() + "초 전"
  }, {
    image: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80",
    name: "jack",
    msg: "hello world",
    time: new Date().getMinutes() + "분 " + new Date().getSeconds() + "초 전"
  }
]

notiData.forEach(d => {
  notification.insertAdjacentHTML("beforeend", `
    <li
      role="menuitem"
      class="cursor-pointer text-slate-800 flex w-full text-sm items-center rounded-md p-3 transition-all hover:bg-slate-100 focus:bg-slate-100 active:bg-slate-100">
      <img
        class="relative inline-block h-10 w-10 rounded-full object-cover object-center"
        src=${d.image}
        alt=${d.name}
      />
      <div class="flex flex-col gap-1 ml-4">
        <p class="text-slate-800 font-medium">
        ${d.msg}
        </p>
        <p class="text-slate-500 text-sm flex items-center">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
               class="w-4 h-4 mr-1 text-slate-400">
            <path fill-rule="evenodd"
                  d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-13a.75.75 0 0 0-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 0 0 0-1.5h-3.25V5Z"
                  clip-rule="evenodd"/>
          </svg>
          ${d.time}
        </p>
      </div>
    </li>
`)
})

// 드롭다운 메뉴와 버튼을 위한 요소를 선택
const ndb = document.getElementById("noti-dropdown-button");
const ndc = document.getElementById("noti-dropdown-content");

// 드롭다운 버튼 클릭 이벤트 핸들러
ndb.addEventListener('click', function () {
  // 드롭다운 컨텐츠의 보이기/숨기기 상태를 토글
  ndc.classList.toggle('hidden');
});

// 화면 어느 곳이든 클릭했을 때의 이벤트 핸들러
window.addEventListener('click', function (e) {
  // 드롭다운 버튼 또는 컨텐츠 외부 클릭 시 드롭다운 숨기기
  if (!ndb.contains(e.target) && !ndc.contains(e.target)) {
    ndc.classList.add('hidden');
  }
});
/*
<button id="noti-dropdown-button" type="button"
                class="relative rounded-full bg-gray-600 text-gray-400 hover:text-white focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-600 focus:outline-hidden hover:cursor-pointer">
          <span class="sr-only">View noti</span>
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
          <ul
            role="menu"
            class="py-2 text-sm text-gray-700 dark:text-gray-200"
          >
            <li
              role="menuitem"
              class="cursor-pointer text-slate-800 flex w-full text-sm items-center rounded-md p-3 transition-all hover:bg-slate-100 focus:bg-slate-100 active:bg-slate-100"
            >
              <img
                alt="tania andrew"
                src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80"
                class="relative inline-block h-10 w-10 rounded-full object-cover object-center"
              />
              <div class="flex flex-col gap-1 ml-4">
                <p class="text-slate-800 font-medium">
                  Tania send you a message
                </p>
                <p class="text-slate-500 text-sm flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                       class="w-4 h-4 mr-1 text-slate-400">
                    <path fill-rule="evenodd"
                          d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-13a.75.75 0 0 0-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 0 0 0-1.5h-3.25V5Z"
                          clip-rule="evenodd"/>
                  </svg>

                  13 minutes ago
                </p>
              </div>
            </li>
            <li
              role="menuitem"
              class="cursor-pointer text-slate-800 flex w-full text-sm items-center rounded-md p-3 transition-all hover:bg-slate-100 focus:bg-slate-100 active:bg-slate-100"
            >
              <img
                alt="natali craig"
                src="https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1061&amp;q=80"
                class="relative inline-block h-10 w-10 rounded-full object-cover object-center"
              />
              <div class="flex flex-col gap-1 ml-4">
                <p class="text-slate-800 font-medium">
                  Natali replied to your email.
                </p>
                <p class="text-slate-500 text-sm flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                       class="w-4 h-4 mr-1 text-slate-400">
                    <path fill-rule="evenodd"
                          d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-13a.75.75 0 0 0-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 0 0 0-1.5h-3.25V5Z"
                          clip-rule="evenodd"/>
                  </svg>
                  1 hour ago
                </p>
              </div>
            </li>
            <li
              role="menuitem"
              class="cursor-pointer text-slate-800 flex w-full text-sm items-center rounded-md p-3 transition-all hover:bg-slate-100 focus:bg-slate-100 active:bg-slate-100"
            >
              <img
                alt="paypal"
                src="https://dwglogo.com/wp-content/uploads/2016/08/PayPal_Logo_Icon.png"
                class="relative inline-block h-10 w-10 rounded-full  object-cover object-center"
              />
              <div class="flex flex-col gap-1 ml-4">
                <p class="text-slate-800 font-medium">
                  You&apos;ve received a payment.
                </p>
                <p class="text-slate-500 text-sm flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor"
                       class="w-4 h-4 mr-1 text-slate-400">
                    <path fill-rule="evenodd"
                          d="M10 18a8 8 0 1 0 0-16 8 8 0 0 0 0 16Zm.75-13a.75.75 0 0 0-1.5 0v5c0 .414.336.75.75.75h4a.75.75 0 0 0 0-1.5h-3.25V5Z"
                          clip-rule="evenodd"/>
                  </svg>
                  5 hours ago
                </p>
              </div>
            </li>
          </ul>
        </div>
 */
