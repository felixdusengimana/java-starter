<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="">
        <div class="flex flex-col h-screen">
         <div class="">
             <jsp:include page="../components/header.jsp"></jsp:include>
         </div>

         <div class="flex-1 grow h-full w-full flex justify-center items-center">
             <div class="">
                 <c:if test="${not empty sessionScope['token']}">

                         <h1>Hey, you're logged in as <strong>${sessionScope['user'].fullNames}</strong></h1>
                         <address>${sessionScope['user'].email}</address>
                         <div>
                             <a class="font-semibold text-blue-400 underline mr-3" href="/student">View Student</a>
                             <a class="font-semibold text-blue-400 underline" href="/student/add">Add Student</a>
                         </div>
                        <div>
                            <a class="font-semibold text-blue-400 underline mr-3" href="/auth/register">View Courses</a>
                            <a class="font-semibold text-blue-400 underline" href="/auth/register">Add Course</a>
                        </div>
                 </c:if>

                <c:if test="${empty sessionScope['token']}">
                        <h1>Welcome to [APP]</h1>
                        <a class="font-semibold text-blue-400 underline mr-3" href="/auth/login">Login</a>
                        <a class="font-semibold text-blue-400 underline" href="/auth/register">Register</a>
                </c:if>
             </div>
         </div>

        <div class="">
            <jsp:include page="../components/footer.jsp"></jsp:include>
        </div>
        </div>
    </body>
</html>