<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공고 목록</title>
</head>
<body id="top">
      <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
         <div class="container">
             <div class="row g-2">
                 <div class="col-md-10">
                     <div class="row g-2">
                         <div class="col-md-4">
                             <input type="text" class="form-control border-0" placeholder="Keyword" />
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0">
                                 <option selected>Category</option>
                                 <option value="1">Category 1</option>
                                 <option value="2">Category 2</option>
                                 <option value="3">Category 3</option>
                             </select>
                         </div>
                         <div class="col-md-4">
                             <select class="form-select border-0">
                                 <option selected>Location</option>
                                 <option value="1">Location 1</option>
                                 <option value="2">Location 2</option>
                                 <option value="3">Location 3</option>
                             </select>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-2">
                     <button class="btn btn-dark border-0 w-100">Search</button>
                 </div>
             </div>
         </div>
     </div>
 
    <div class="container-xxl py-5">
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Explore By Companies</h1>
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-mail-bulk text-primary mb-4"></i>
                        <h6 class="mb-3">Marketing</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                        <h6 class="mb-3">Customer Service</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>
                        <h6 class="mb-3">Human Resource</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-tasks text-primary mb-4"></i>
                        <h6 class="mb-3">Project Management</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-chart-line text-primary mb-4"></i>
                        <h6 class="mb-3">Business Development</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-hands-helping text-primary mb-4"></i>
                        <h6 class="mb-3">Sales & Communication</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-book-reader text-primary mb-4"></i>
                        <h6 class="mb-3">Teaching & Education</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <a class="cat-item rounded p-4" href="">
                        <i class="fa fa-3x fa-drafting-compass text-primary mb-4"></i>
                        <h6 class="mb-3">Design & Creative</h6>
                        <p class="mb-0">123 Vacancy</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>