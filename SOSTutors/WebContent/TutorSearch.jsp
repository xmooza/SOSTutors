<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Tutor Scheduling Website">
    <meta name="author" content="SOSTutors">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>SOSTutors - Tutor Search</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <!-- FontAwesome-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <!-- Google -->
    <link href='https://fonts.googleapis.com/css?family=Quicksand|Roboto' rel='stylesheet' type='text/css'>

    <!-- Custom Styles-->
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
</head>

<body class="body">
    <!-- HEADER -->
    <div class="navbar navbar-fixed-top">
        <a class="navbar-brand" href="#">SOSTutors</a>
    </div>

    <!-- SEARCH & FILTER FORM -->
    <div class="container-fluid filterform">
        <div class="row">
            <div class="col-md-5">
                <input class="form-control input-lg" type="text">
            </div>
            <div class="col-md-3">
                <div class="col-xs-5">
                    <select name="subject" class="form-control">
                        <option value="AllSub">All Subjects</option>
                        <option value="Math">Mathematics</option>
                        <option value="Science">Science</option>
                        <option value="English">English</option>
                        <option value="French">French</option>
                        <option value="Computers">Computer Science</option>
                    </select>
                </div>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <button class="btn btn-default input-lg whitebtn fullwidthbtn" type="button">Advanced</button>
            </div>
            <div class="col-md-2 col-sm-6 col-xs-6">
                <button class="btn btn-default input-lg greenbtn fullwidthbtn" type="button">Search</button>
            </div>
        </div>
    </div>

    <!-- RESULTS FORM -->
    <div class="container-fluid resultform">

        <div class="row">

            <div class="col-sm-6 col-md-6">
                <div class="tutorform">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="tutimg">
                                <img src="images/pic1_thumb.png">
                            </div>
                            <div class="tutrating">
                                <h4><b>$9/hr</b></h4>
                                <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></h4>
                            </div>
                        </div>
                        <div class="col-md-8 tutdesc">
                            <h3>Barry Trotts</h3>
                            <h6><i>Waterloo University</i></h6>
                            <h5><b>Mathematics, Science, and 7 Other Subjects</b></h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a faucibus ipsum, sit amet luctus massa. Ut gravida est ac.</p>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12 tutinfo">
                            <a class="btn btn-default fullwidthbtn" role="button" href="Tutor.jsp">More Info</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-6">
                <div class="tutorform">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="tutimg">
                                <img src="images/pic2_thumb.png">
                            </div>
                            <div class="tutrating">
                                <h4><b>$12/hr</b></h4>
                                <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i></h4>
                            </div>
                        </div>
                        <div class="col-md-8 tutdesc">
                            <h3>Lester Been</h3>
                            <h6><i>Algonquin College</i></h6>
                            <h5><b>Mathematics, Electronics and Physics</b></h5>
                            <p>Vestibulum a dignissim nisl, quis iaculis risus. Integer commodo elit eget est elementum volutpat. Pellentesque egestas magna vitae metus porttitor.</p>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12 tutinfo">
                            <a class="btn btn-default fullwidthbtn" role="button">More Info</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-6">
                <div class="tutorform">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="tutimg">
                                <img src="images/pic3_thumb.png">
                            </div>
                            <div class="tutrating">
                                <h4><b>$15/hr</b></h4>
                                <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></h4>
                            </div>
                        </div>
                        <div class="col-md-8 tutdesc">
                            <h3>DeAndre Jordan</h3>
                            <h6><i>Everest College</i></h6>
                            <h5><b>Psychology, Sociology and 2 Other Subjects</b></h5>
                            <p>Nullam ipsum nisi, consequat eget pellentesque at, egestas et tortor. Praesent id lacus sollicitudin, fringilla felis sit amet, commodo nunc.</p>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12 tutinfo">
                            <a class="btn btn-default fullwidthbtn" role="button">More Info</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-6">
                <div class="tutorform">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="tutimg">
                                <img src="images/pic4_thumb.png">
                            </div>
                            <div class="tutrating">
                                <h4><b>$10/hr</b></h4>
                                <h4><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i></h4>
                            </div>
                        </div>
                        <div class="col-md-8 tutdesc">
                            <h3>Ally Silverstein</h3>
                            <h6><i>Carleton University</i></h6>
                            <h5><b>Computer Science and Biology</b></h5>
                            <p>Fusce scelerisque interdum dictum. Aliquam erat volutpat. In hendrerit, sapien ut malesuada mattis, orci risus sollicitudin arcu, ac aliquam ligula.</p>
                        </div>
                        <div class="col-md-8 col-sm-12 col-xs-12 tutinfo">
                            <a class="btn btn-default fullwidthbtn" role="button">More Info</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <h5 style="text-align: center">Showing 4 of 4 results.</h5>

    </div>
</body>

</html>