const announcement = document.getElementById("announcement-container");
let announceData = [
  {
    aname: "자바 백엔드 개발자 구인(신입)1",
    cname: "(주)우아한 형제들",
    address: "경기도 성남시 판교로",
    career: "신입",
    education: "고졸 이상",
    deadline: "~3월 21일(금)"
  },
  {
    aname: "자바 백엔드 개발자 구인(신입)2",
    cname: "(주)우아한 형제들",
    address: "경기도 성남시 판교로",
    career: "신입",
    education: "고졸 이상",
    deadline: "~3월 21일(금)"
  },
  {
    aname: "자바 백엔드 개발자 구인(신입)3",
    cname: "(주)우아한 형제들",
    address: "경기도 성남시 판교로",
    career: "신입",
    education: "고졸 이상",
    deadline: "~3월 21일(금)"
  }
]

announceData.forEach((d) => {
  announcement.insertAdjacentHTML("beforeend", `<a
    href="#"
    class="size-auto min-h-50 min-w-50 align-middle border-solid border-1 border-gray-600 overflow-hidden text-ellipsis rounded-3xl hover:shadow-[0_15px_15px_rgba(0,0,0,0.25)] hover:cursor-pointer active:shadow-none">
    <img
      class="w-full"
      src="https://images.unsplash.com/photo-1682407186023-12c70a4a35e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80"
      alt=""/>
    <div class="p-4">
      <p class="text-xl font-bold">${d.aname}</p>
      <p class="text-base">${d.cname}</p>
      <p class="text-sm">${d.address} | ${d.career} | ${d.education}</p>
      <p class="text-sm text-right">${d.deadline}</p>
    </div>
  </a>`)
})

/*
<a
    href="#"
    class="size-auto min-h-50 min-w-50 align-middle border-solid border-1 border-gray-600 overflow-hidden text-ellipsis rounded-3xl hover:shadow-[0_15px_15px_rgba(0,0,0,0.25)] hover:cursor-pointer">
    <img
      class="w-full"
      src="https://images.unsplash.com/photo-1682407186023-12c70a4a35e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2832&q=80"
      alt=""/>
    <div class="p-4">
      <p class="text-xl font-bold">채용공고 제목</p>
      <p class="text-base">회사명</p>
      <p class="text-sm">근무지역 | 경력 | 학력</p>
      <p class="text-sm text-right">마감일</p>
    </div>
  </a>
 */

