<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <jsp:include page="../../components/header.jsp"></jsp:include>
            </div>

            <div class="flex-1 grow h-full w-full flex justify-center items-center">
                <form class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 w-1/4"
                method="post"
                action="/auth/register">
                    <h1 class="font-bold text-3xl text-blue-500">Sign up</h1>
                    <p class="text-sm font-medium text-gray-400 mb-5">Don't miss anything</p>

                    <c:if test="${not empty error}">
                        <div class="bg-red-700 rounded w-full py-2 px-3 my-2 text-white capitilize">
                                ${error}
                        </div>
                    </c:if>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="fullname">
                            Full Name
                        </label>
                        <input class="shadow appearance-none border border-blue-500 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                               id="fullname"
                               type="text"
                               name="fullNames"
                               placeholder="Full Name">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="nationalId">
                            National ID
                        </label>
                        <input class="shadow appearance-none border border-blue-500 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                               id="nationalId"
                               type="text"
                               name="nationalId"
                               autocomplete="off"
                               value="1234567890234567"
                               placeholder="National Identification Number">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">
                            Phone Number
                        </label>
                        <input class="shadow appearance-none border border-blue-500 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                               id="phone"
                               type="text"
                               name="phoneNumber"
                               placeholder="Phone number">
                    </div>

                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                            Email
                        </label>
                        <input class="shadow appearance-none border border-blue-500 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                               id="email"
                               type="email"
                               name="email"
                               placeholder="Email">
                    </div>

                    <div class="mb-6">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input class="shadow appearance-none border border-blue-500 rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                               id="password"
                               name="password"
                               type="password"
                               placeholder="******************">
<%--                        <p class="text-red-500 text-xs italic">Please choose a password.</p>--%>
                    </div>
                    <div class="flex items-center justify-between">
                        <button
                                class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                                type="submit">
                            Sign Up
                        </button>
                        <p class="inline-block align-baseline text-sm ">
                            Already have an account? <a
                                class="font-normal text-blue-500 hover:text-blue-800 cursor-pointer"
                        href="/auth/login">Sign In</a>
                        </p>
                    </div>
                </form>

<%--                <a class="font-semibold text-blue-400 underline" href="/auth/register">Register</a>--%>
            </div>

            <div class="">
                <jsp:include page="../../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>