<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Title</title>
</head>
<body>
<div class="max-w-sm bg-white rounded-lg shadow-lg dark:bg-gray-800 p-4 pb-0 md:p-6 hover:shadow-2xl">
    <div class="flex justify-between pb-4 mb-4 border-b border-gray-200 dark:border-gray-700">
        <div class="flex items-center">
            <div class="text-left">
                <h5 class="leading-none text-2xl font-bold text-gray-900 dark:text-white pb-1">
                    3.4k</h5>
                <p class="text-sm font-normal text-gray-500 dark:text-gray-400">
                    공고 대비 지원자(주간)
                </p>
            </div>
        </div>
        <div>
          <span class="bg-green-100 text-green-800 text-xs font-medium inline-flex items-center px-2.5 py-1 rounded-md dark:bg-green-900 dark:text-green-300">
            <svg class="w-2.5 h-2.5 me-1.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="none" viewBox="0 0 10 14">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                    stroke-width="2" d="M5 13V1m0 0L1 5m4-4 4 4"/>
            </svg>
            42.5%
          </span>
        </div>
    </div>
    <div id="column-chart"></div>
</div>

</body>
<script>

  const recruitOptions = {
    colors: ["#1A56DB", "#FDBA8C"],
    series: [
      {
        name: "공고",
        color: "#1A56DB",
        data: [
          {x: "Mon", y: 231},
          {x: "Tue", y: 122},
          {x: "Wed", y: 63},
          {x: "Thu", y: 421},
          {x: "Fri", y: 122},
          {x: "Sat", y: 323},
          {x: "Sun", y: 111},
        ],
      },
      {
        name: "지원자",
        color: "#FDBA8C",
        data: [
          {x: "Mon", y: 232},
          {x: "Tue", y: 113},
          {x: "Wed", y: 341},
          {x: "Thu", y: 224},
          {x: "Fri", y: 522},
          {x: "Sat", y: 411},
          {x: "Sun", y: 243},
        ],
      },
    ],
    chart: {
      type: "bar",
      height: "320px",
      fontFamily: "Inter, sans-serif",
      toolbar: {
        show: false,
      },
    },
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: "70%",
        borderRadiusApplication: "end",
        borderRadius: 8,
      },
    },
    tooltip: {
      shared: true,
      intersect: false,
      style: {
        fontFamily: "Inter, sans-serif",
      },
    },
    states: {
      hover: {
        filter: {
          type: "darken",
          value: 1,
        },
      },
    },
    stroke: {
      show: true,
      width: 0,
      colors: ["transparent"],
    },
    grid: {
      show: false,
      strokeDashArray: 4,
      padding: {
        left: 2,
        right: 2,
        top: -14
      },
    },
    dataLabels: {
      enabled: false,
    },
    legend: {
      show: false,
    },
    xaxis: {
      floating: false,
      labels: {
        show: true,
        style: {
          fontFamily: "Inter, sans-serif",
          cssClass: 'text-xs font-normal fill-gray-500 dark:fill-gray-400'
        }
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
    fill: {
      opacity: 1,
    },
  }

  if (document.getElementById("column-chart") && typeof ApexCharts !== 'undefined') {
    const chart = new ApexCharts(document.getElementById("column-chart"), recruitOptions);
    chart.render();
  }

</script>