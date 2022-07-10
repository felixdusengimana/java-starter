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
                <div class="text-center">
                    <h1 class="text-8xl font-bold text-blue-500">404</h1>
                    <p class="text-gray-400 font-medium">Page not found!</p>
                </div>
            </div>

            <div class="">
                <jsp:include page="../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>