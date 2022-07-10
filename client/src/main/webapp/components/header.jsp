<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="bg-black flex flex-row justify-between px-10 py-5">
   <h1 class="text-white font-bold text-lg">[APP]</h1>
    <div class="flex gap-10 text-white">
        <a href="">Home</a>
        <a href="">About</a>
        <a href="">Help</a>
    </div>
    <div class="flex gap-10 text-white">

        <c:if test="${not empty sessionScope['token']}">
            <div class="flex flex-row gap-3">
                <div class="h-7 w-7 bg-blue-500 rounded-full"></div>
                <a href="" class="mr-2">${sessionScope['user'].fullNames}</a>
                <a href="/auth/logout">Logout</a>
            </div>
        </c:if>

        <c:if test="${empty sessionScope['token']}">
            <a href="/auth/login">Login</a>
            <a href="/auth/register">Register</a>
        </c:if>
    </div>
</div>