<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Title</title>
</head>
<body>
<div class="max-w-sm bg-white rounded-lg shadow-lg dark:bg-gray-800 p-4 pb-0 md:p-6 hover:shadow-2xl">
    <div class="flex justify-between border-b pb-4 border-gray-200 dark:border-gray-700">
        <div>
            <h5 class="text-left leading-none text-3xl font-bold text-gray-900 dark:text-white pb-2">
                <%--                    ${vo.getCount()}--%> 25K
            </h5>
            <p class="text-left font-normal text-gray-500 dark:text-gray-400">
                유저 수
            </p>
        </div>
        <div class="flex items-center px-2.5 py-0.5 text-base font-semibold text-green-500 dark:text-green-500 text-center">
            38%
            <svg class="w-3 h-3 ms-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="none" viewBox="0 0 10 14">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                      stroke-width="2" d="M5 13V1m0 0L1 5m4-4 4 4"/>
            </svg>
        </div>
    </div>
    <div id="area-chart"></div>
</div>
</body>
<script>
  const options = {
    chart: {
      height: "140%",
      maxWidth: "100%",
      type: "area",
      fontFamily: "Inter, sans-serif",
      dropShadow: {
        enabled: false,
      },
      toolbar: {
        show: false,
      },
    },
    tooltip: {
      enabled: true,
      x: {
        show: false,
      },
    },
    fill: {
      type: "gradient",
      gradient: {
        opacityFrom: 0.55,
        opacityTo: 0,
        shade: "#1C64F2",
        gradientToColors: ["#1C64F2"],
      },
    },
    dataLabels: {
      enabled: false,
    },
    stroke: {
      width: 6,
    },
    grid: {
      show: false,
      strokeDashArray: 4,
      padding: {
        left: 2,
        right: 2,
        top: 0
      },
    },
    series: [
      {
        name: "New users",
        data: [6500, 6418, 6456, 6526],
        color: "#1A56DB",
      },
    ],
    xaxis: {
      categories: ['25-1', '25-2', '25-3', '25-4'],
      labels: {
        show: false,
      },
      axisBorder: {
        show: false,
      },
      axisTicks: {
        show: false,
      },
    },
    yaxis: {
      show: false,
    },
  }

  if (document.getElementById("area-chart") && typeof ApexCharts !== 'undefined') {
    const chart = new ApexCharts(document.getElementById("area-chart"), options);
    chart.render();
  }
</script>