<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>Flex - Responsive HTML Template</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
Flex Template 
http://www.templatemo.com/tm-406-flex
-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'> 
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/templatemo_style.css">

        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
        
<style type="text/css">
	.aaaa{
		width:600px;
		height:600px;
	}
</style>
    </head>
    <body>
    
    
    
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->


        <div class="site-main" id="sTop">
            <div class="site-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
                            <c:choose>
                            <c:when test="${sessionScope.loginDto eq null }">
                                <li>aaaaaaaaaaaaaaaaaaaaaaa</li>                            
                            </c:when>
                            <c:otherwise>
                            	<li>${sessionScope.loginDto.uId_ }님 안녕하세요</li>
                            </c:otherwise>
                            </c:choose>
                            </ul>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    <h1>
                                        <a href="#">북리뷰</a>
                                    </h1>
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-10 col-sm-10 main-menu text-right">
                                    <div class="toggle-menu visible-sm visible-xs"><i class="fa fa-bars"></i></div>
                                    <ul class="menu-first">
                                        <li class="active"><a href="#">홈</a></li>                            
                                        <li><a href="adminGoodsPage">상품등록</a></li>                                 
                                        <li><a href="adminGoodsViewPage">관리자교환소</a></li>                                 
                                        <li><a href="goodsViewPage">유저용교환소</a></li>                                 
                                        <li><a href="LoginPage">로그인</a></li>   
                                        <li><a href="bookChart">북차트</a></li>                              
                                    </ul>                                  
                                </div> <!-- /.main-menu -->
                            </div>
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                        <li>
                                <div class="overlay"></div>
                                <img src="images/slide3.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>북리뷰 사이트명 프로젝트명</h2>
                                    <p>책을 리뷰하다 ㅇㅇㅇㅇ</p>
                                
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide1.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>리뷰 이벤트</h2>
                                    <p>리뷰 작성 시 포인트 지급</p>
                                    <a href="#" class="slider-btn">이벤트 내용 바로가기</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="images/slide2.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>포인트 활용하기</h2>
                                    <p>모은 포인트로 구매하기 !</p>
                                    <a href="pointPage" class="slider-btn">포인트 교환소 바로가기</a>
                                </div>
                            </li>
                            
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->
        <div class="aaaa">
                        <canvas id="myChart" width="600" height="600"></canvas>


        <script>
              var ctx = document.getElementById("myChart");
              var myChart = new Chart(ctx, {
                  type: 'bar',
                  data: {
                      labels: ["월요일", "화요일", "수요일","목요일","금요일","토요일","일요일"],
                      datasets: [{
                          label: '매일매일 독서리뷰',
                          data: [${bcdto.MON},${bcdto.TUE},${bcdto.WEN},${bcdto.TUR},${bcdto.FRI},${bcdto.SAT},${bcdto.SUN}],
                          backgroundColor: [
                              'rgba(255, 99, 132, 0.2)',
                              'rgba(54, 162, 235, 0.2)',
                              'rgba(255, 206, 86, 0.2)',
                              'rgba(75, 192, 192, 0.2)',
                              'rgba(153, 102, 255, 0.2)',
                              'rgba(255, 159, 64, 0.2)',
                              'rgba(200, 189, 64, 0.2)'
                          ],
                          borderColor: [
                              'rgba(255,99,132,1)',
                              'rgba(54, 162, 235, 1)',
                              'rgba(255, 206, 86, 1)',
                              'rgba(75, 192, 192, 1)',
                              'rgba(153, 102, 255, 1)',
                              'rgba(255, 159, 64, 1)',
                              'rgba(200, 189, 64, 1)'
                          ]
                      }]
                  }
              });
        </script>
</div>



        <div class="content-section" id="services">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>사이트 추천책</h2>
                   
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-1">
                            <div class="service-icon">
                                <i class="fa fa-file-code-o"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>HTML5 Coding</h3>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, assumenda, eveniet, consectetur, ex doloribus veniam asperiores incidunt mollitia placeat aniet.</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-2">
                            <div class="service-icon">
                                <i class="fa fa-paper-plane-o"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>Our Support</h3>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, assumenda, eveniet, consectetur, ex doloribus veniam asperiores incidunt mollitia placeat aniet.</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-3">
                            <div class="service-icon">
                                <i class="fa fa-institution"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>Our Design</h3>
                                   <p>We make HTML CSS templates that are responsive for any screen size on any device. Feel free to download and use our templates without restrictions.</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-4">
                            <div class="service-icon">
                                <i class="fa fa-flask"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>Go for mobile</h3>
                                   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim, assumenda, eveniet, consectetur, ex doloribus veniam asperiores incidunt mollitia placeat aniet.</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#services -->


	<div>
    <canvas id="myChart" width="400" height="400"></canvas>
	</div>

        <div class="content-section" id="our-team">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>리뷰게시판</h2>
                        <p><a href="#">리뷰 더보기</a></p>
                        
                 	</div>
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#our-team -->
            
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>Copyright &copy; 2014 Company Name</span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Back to top</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
        
        <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/bootstrap.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

     
        <!-- templatemo 406 flex -->
    </body>
</html>