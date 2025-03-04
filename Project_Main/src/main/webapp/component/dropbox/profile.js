import {pageUrl} from "../../constants/dirname.js";

const profile = document.getElementById("profile-container");
const profileData = {
  image: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=1480&amp;q=80",
  name: "jack",
  email: "webapp@gmail.com",
}
console.log(pageUrl + 'login.html/?page=login')
if (!profileData) {
  profile.insertAdjacentHTML("beforeend", `
    <div>
      <button type="button" id="profile-dropdown-button"
              class="flex p-1 text-sm bg-gray-600 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-200 cursor-pointer">
        <span class="sr-only">Open user menu</span>
        <span class="mx-0 p-2 text-center vertical-middle text-white">${profileData.name}</span>
        <img
          class="relative inline-block size-10 rounded-full object-cover object-center p-1"
          src=${profileData.image}
          alt=""
        />
      </button>
    </div>
    <!-- Dropdown menu -->
    <div id="profile-dropdown-content"
         class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white ring-1 shadow-lg ring-black/5 focus:outline-hidden hidden">
      <div class="px-4 py-3 text-sm text-gray-900 dark:text-white">
        <div class="font-medium truncate">${profileData.email}</div>
      </div>
      <ul class="py-2 text-sm text-gray-700 dark:text-gray-600">
        <li>
          <a href="#"
             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">마이페이지</a>
        </li>
        <li>
          <a href="#"
             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">이력서</a>
        </li>
        <li>
          <a href="#"
             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">설정</a>
        </li>
      </ul>
      <div class="py-2">
        <a href="#"
           class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">로그아웃</a>
      </div>
    </div>`
  )

  // 드롭다운 메뉴와 버튼을 위한 요소를 선택
  const pdb = document.getElementById("profile-dropdown-button");
  const pdc = document.getElementById("profile-dropdown-content");

  // 드롭다운 버튼 클릭 이벤트 핸들러
  pdb.addEventListener('click', function () {
    // 드롭다운 컨텐츠의 보이기/숨기기 상태를 토글
    pdc.classList.toggle('hidden');
  });

  // 화면 어느 곳이든 클릭했을 때의 이벤트 핸들러
  window.addEventListener('click', function (e) {
        // 드롭다운 버튼 또는 컨텐츠 외부 클릭 시 드롭다운 숨기기
        if (!pdb.contains(e.target) && !pdc.contains(e.target)) {
          pdc.classList.add('hidden');
        }
      }
  );
} else {
  const goLogin = () => {
    return window.location.replace(pageUrl + "login.html?page=11")
  }
  const button = document.createElement('button');
  button.textContent = '로그인';
  button.classList.add('rounded-md', 'border-1', 'border-slate-600', 'py-2',
      'px-4', 'text-center', 'text-sm', 'shadow-sm', 'shadow-lg',
      'text-slate-600', 'text-white', 'bg-slate-800', 'hover:border-white',
      'hover:border-1', 'hover:cursor-pointer', 'focus:text-white',
      'focus:bg-slate-800', 'focus:border-slate-800', 'active:border-white',
      'active:bg-slate-800', 'disabled:pointer-events-none',
      'disabled:opacity-50', 'disabled:shadow-none');
  button.type = 'button';
  button.addEventListener('click', goLogin);
  profile.appendChild(button);

}
