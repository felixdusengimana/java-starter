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
                 <h1>Welcome to [APP]</h1>
                 <a class="font-semibold text-blue-400 underline mr-3" href="/auth/">Login</a>
                 <a class="font-semibold text-blue-400 underline" href="/auth/register">Register</a>
             </div>
         </div>

        <div class="">
            <jsp:include page="../components/footer.jsp"></jsp:include>
        </div>
        </div>
    </body>
</html>