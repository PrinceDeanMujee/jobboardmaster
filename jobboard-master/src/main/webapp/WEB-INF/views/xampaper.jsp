<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      layout:decorator="layout/template">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <head>

        <meta charset="utf-8">
        <meta name="author" content="">
        <title>Search jobs | FindJobs.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style type="text/css">
            #requirements {
                margin-top: 10px;
                padding-top: 50px;
                padding-bottom: 50px;
                color: #fff;
                background-color: #3F729B;
            }

            #team {
                margin-top: 10px;
                padding-top: 50px;
                padding-bottom: 50px;
                color: #fff;
                background-color: #2E2E2E;
            }

            .jumbotron {
                margin-bottom: 10px;
            }

            .a1{
                font-size: 24px;
            }
            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            .results {
                margin: 0px 100px 0px 100px;
                padding: 50px 100px 10px 100px;
                border-right: 1px solid #bdbdbd;
                border-left: 1px solid #bdbdbd;
            }
            /* Set a style for all buttons */
            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the image and position the close button */
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            .groups{
                line-height: 90%;
            }

            img.avatar {
                width: 10%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0, 0, 0); /* Fallback color */
                background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto;
                /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 40%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover, .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Add Zoom Animation */
            .animate {
                -webkit-animation: animatezoom 0.6s;
                animation: animatezoom 0.6s
            }

            @
            -webkit-keyframes animatezoom {
                from {-webkit-transform: scale(0)
                }

                to {
                    -webkit-transform: scale(1)
                }

            }
            @
            keyframes animatezoom {
                from {transform: scale(0)
                }

                to {
                    transform: scale(1)
                }

            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }
                .cancelbtn {
                    width: 100%;
                }
            }

            .row.vertical-divider {
                overflow: hidden;
            }

            .row.vertical-divider>div[class^="col-"] {
                text-align: center;
                padding-top: 5%;
                /*padding-bottom: 100px;*/
                margin-top: 30px;
                /*margin-bottom: -100px;*/
                border-left: 3px solid #689f38;
                border-right: 3px solid #689f38;
            }

            .row1 {
                overflow: hidden;
            }

            .row2 {
                margin-bottom: -99999px;
                padding-bottom: 99999px;
            }

            body {
                padding-top: 20px;
                padding-bottom: 20px;
            }
        </style>


    </head>

    <body id="pagetop">

        <div class="container-fluid">

            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/jobboard/index">BUSE Recruitment</a>
                    </div>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown"><a class="dropdown-toggle"
                                                data-toggle="dropdown" href="#">logged in as
                                BUSE <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="/jobboard/company/profile/${company.companyId}">Profile</a></li>
                                <li><a href="/jobboard/index">Logout</a></li>
                            </ul></li>
                    </ul>
                </div>
            </nav>


            <div class="jumbotron">
                <div class="container text-center">
                <div class="container-fluid" style="margin-top: 40px">${message}</div>



                    <h2>Interview Questions for ${job.title}</h2>
                    <p id="time">0</p>

                </div>
            </div>


            <div class="results">
                <h2>Answer all questions</h2>
                <p>${fn:length(questions)} questions</p>
                    <form id="myForm" method="post" action="/jobboard/submitexam" modelAttribute="dto">
                <c:forEach items="${questions}" var="qsn" varStatus="status">
                    <h4>${qsn.question}</h4>
                    <div class="custom-control custom-radio">
                        <input type="radio" class="custom-control-input" id="defaultGroupExample1" name="questions[${status.index}].selected">
                        <label class="custom-control-label" for="defaultGroupExample1">${qsn.optionA}</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" class="custom-control-input" id="defaultGroupExample1" name="questions[${status.index}].selected">
                        <label class="custom-control-label" for="defaultGroupExample1">${qsn.optionB}</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" class="custom-control-input" id="defaultGroupExample1" name="questions[${status.index}].selected">
                        <label class="custom-control-label" for="defaultGroupExample1">${qsn.optionC}</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" class="custom-control-input" id="defaultGroupExample1" name="questions[${status.index}].selected">
                        <label class="custom-control-label" for="defaultGroupExample1">${qsn.optionC}</label>
                    </div>
                    <input type="hidden" name="questions[${status.index}].answer" value="${qsn.answer}">
                </c:forEach>
                <input type="hidden" name ="appId" value="${application.appId}">
                <button type="submit" class="btn btn-block btn-primary">Finish</button>
                </form>
        <!-- <p>Posted by: <c:out value="${job.company}"></c:out></p>
        <p>Status: <c:out value="${job.location}"></c:out></p>
        <p>Status: <c:out value="${job.salary}"></c:out></p>
        <p>${job.description}</p>
                -->

            </div>

        </div>
    </div>

    <script>
        var data = '${timeleft}';
        document.getElementById("time").innerHTML = data  + " minutes left";


        
        
       var myVar = setInterval(Timer, 60000);

        function Timer() {
            data = (data - 1)
            document.getElementById("time").innerHTML = data + " minutes left";
            if (data < 1){
                document.getElementById("myForm").submit();
            }
        }

    </script>

</body>

</html>