<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>papers</title>

    <style>
        li {
            margin-top: 5px;
            margin-bottom: 10px;
            padding-left: 5px
        }

        p {
            margin-left: 15px;
            margin-top: 20px;
            font-size: 16px;
        }

        label:hover {
            background: SeaShell;
            color: OrangeRed
        }
        div {
            word-spacing: 10px;


        }


        .questionbox {
            BORDER-RIGHT: 3px inset;
            BORDER-TOP: 3px inset;
            BORDER-LEFT: 3px inset;
            WIDTH: 90%;
            BORDER-BOTTOM: 3px inset;
            HEIGHT: 80%
        }
    </style>
</head>
<jsp:include page="nav.jsp" flush="true" />
<body onload=setTimer(${leftTime})>

<div class="container">
    <div class="row">
        <div class="col-md-4">
            <h2>
                Question ${currentPage+1} / ${pageSize}
            </h2>
        </div>
        <div class="col-md-8 text-right text-warning">
            <h3>Time Remaining: <span id="leftTime"></span></h3>
        </div>

        <form action="${pageContext.request.contextPath}/doquiz" method="GET">
            <div class="col-md-12 questionbox">
                <h3 class="pl-2">${question.getQuiz_description()}</h3>
                <input type="hidden" name="qtid" value="0"/>
                <input id="Timer" type="hidden" name="lefttime" value="0"/>
                <input type="hidden" name="page" value="${currentPage}"/>
                <c:forEach var="choice" items="${choices}">
                    <p><input type="radio" class="form-check-input pl-2" name="optradio" id=O${choice.getChoice_id()}
                              value="${choice.getChoice_id()}"
                        ${qq.getChoiceId() == choice.getChoice_id()  ? "checked=\"checked\"" : ""} >
                        <label for="O${choice.getChoice_id()}">
                                ${choice.getChoice_description()}
                        </label>
                    </p>
                </c:forEach>
            </div>
                <div style="margin-top: 20px ;margin-left: 20px" class="btn-group btn-group col-4">
                    <c:if test="${currentPage != 0}">
                        <button name="action" value="prev" class="btn btn-Info " type="submit">Prev</button>
                    </c:if>
                    <c:if test="${currentPage != pageSize -1}">
                        <button name="action" value="next" class="btn btn-Info " type="submit">Next</button>
                    </c:if>
                    <c:if test="${currentPage == pageSize -1}">
                        <button name="action" value="finish" class="btn btn-Info " type="submit">Finish</button>
                    </c:if>

                </div>
            <div>
                <button name="action" value="0" class="btn btn-Info " type="submit">1</button>
                <button name="action" value="1" class="btn btn-Info " type="submit">2</button>
                <button name="action" value="2" class="btn btn-Info " type="submit">3</button>
                <button name="action" value="3" class="btn btn-Info " type="submit">4</button>
                <button name="action" value="4" class="btn btn-Info " type="submit">5</button>


<%--                <a href="${pageContext.request.contextPath}/doquiz?qtid=1&lefttime=900&page=0&action=default">1 </a>--%>
<%--                <a href="${pageContext.request.contextPath}/doquiz?qtid=1&lefttime=900&page=1&action=ddefault">2 </a>--%>
<%--                <a href="${pageContext.request.contextPath}/doquiz?qtid=1&lefttime=900&page=2&action=default">3 </a>--%>
<%--                <a href="${pageContext.request.contextPath}/doquiz?qtid=1&lefttime=900&page=3&action=default">4 </a>--%>
<%--                <a href="${pageContext.request.contextPath}/doquiz?qtid=1&lefttime=900&page=4&action=default">5 </a>--%>

            </div>


        </form>
    </div>

</div>
<script type="text/javascript">

    function  setTimer(leftSeconds) {
        document.getElementById("leftTime").innerText =Math.trunc(leftSeconds/60).toString() + ":" + (leftSeconds%60).toString().padStart(2,"0");
        window.setInterval(function () {
            leftSeconds = leftSeconds - 1;
            if ( leftSeconds === 0) {
                alert("Time is Over")
                window.location.href="${pageContext.request.contextPath}/doquiz?action=finish&page=${currentPage}&lefttime=0&qtid=0"
            }
            document.getElementById("leftTime").innerText = Math.trunc(leftSeconds/60).toString() + ":" + (leftSeconds%60).toString().padStart(2,"0");
            document.getElementById("Timer").value = leftSeconds;
        }, 1000);
    }
</script>
</body>
</html>

