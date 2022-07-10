<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%--                <div class="">--%>
<%--&lt;%&ndash;                    [${students}] students&ndash;%&gt;--%>
<%--                </div>--%>

    <!-- Table -->
    <div class="w-full max-w-4xl mx-auto bg-white shadow-lg rounded-sm border border-gray-200">
        <header class="px-5 py-4 border-b border-gray-100">
            <div class="font-semibold text-gray-800">Students Table</div>
        </header>

        <div class="overflow-x-auto p-3">
            <table class="table-auto w-full">
                <thead class="text-xs font-semibold uppercase text-gray-400 bg-gray-50">
                    <tr>
                        <th></th>
                        <th class="p-2">
                            <div class="font-semibold text-left">Student Names</div>
                        </th>
                        <th class="p-2">
                            <div class="font-semibold text-left">Email</div>
                        </th>
                        <th class="p-2">
                            <div class="font-semibold text-left">Phone Number</div>
                        </th>

                        <th class="p-2">
                            <div class="font-semibold text-left">National ID</div>
                        </th>

                        <th class="p-2">
                            <div class="font-semibold text-left">Total Courses</div>
                        </th>

                        <th class="p-2">
                            <div class="font-semibold text-center">Actions</div>
                        </th>
                    </tr>
                </thead>

                <tbody class="text-sm divide-y divide-gray-100">
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td class="p-2">
                            <input type="checkbox" class="w-5 h-5" value="id-1"/>
                        </td>
                        <td class="p-2">
                            <div class="font-medium text-gray-800">
                                ${student.names}
                            </div>
                        </td>
                        <td class="p-2">
                            <div class="text-left">${student.email}</div>
                        </td>
                        <td class="p-2">
                            <div class="text-left font-medium text-green-500">
                                ${student.phoneNumber}
                            </div>
                        </td>
                        <td class="p-2">
                            <div class="text-left font-medium text-green-500">
                                ${student.nationalId}
                            </div>
                        </td>
                        <td class="p-2">
                            <div class="text-left font-medium text-green-500">
                                ${student.courses.size()}
                            </div>
                        </td>
                        <td class="p-2">
                            <div class="flex justify-center">
                                <button>
                                    <svg class="w-8 h-8 hover:text-blue-600 rounded-full hover:bg-gray-100 p-1"
                                         fill="none" stroke="currentColor" viewBox="0 0 24 24"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                              d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                        </path>
                                    </svg>
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- total amount -->
        <div class="flex justify-end font-medium space-x-4 text-sm border-t border-gray-100 px-5 py-4">
            <div>Total</div>
            <div class="text-blue-600">${fn:length(students)}</div>
        </div>

<%--        <div class="flex justify-end">--%>
<%--            <!-- send this data to backend (note: use class 'hidden' to hide this input) -->--%>
<%--            <input type="hidden" class="border border-black bg-gray-50" x-model="selected" />--%>
<%--        </div>--%>
    </div>
            </div>

            <div class="">
                <jsp:include page="../../components/footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>